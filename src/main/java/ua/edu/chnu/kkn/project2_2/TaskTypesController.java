package ua.edu.chnu.kkn.project2_2;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/tasktypes")
public class TaskTypesController {

    private final TaskTypesRepository taskTypesRepository;

    public TaskTypesController(TaskTypesRepository taskTypesRepository) {
        this.taskTypesRepository = taskTypesRepository;
    }

    private void addRoleToModel(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String role = auth.getAuthorities().stream()
                .findFirst()
                .map(a -> a.getAuthority())
                .orElse("");
        model.addAttribute("role", role);
    }

    @GetMapping
    public String listTaskTypes(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String sortBy,
            Model model
    ) {
        List<TaskTypes> taskTypes = taskTypesRepository.findAll();

        if (keyword != null && !keyword.isEmpty()) {
            String lowerKeyword = keyword.toLowerCase();
            taskTypes = taskTypes.stream()
                    .filter(tt -> tt.getDescription().toLowerCase().contains(lowerKeyword))
                    .collect(Collectors.toList());
        }

        if ("nameAsc".equals(sortBy)) {
            taskTypes = taskTypes.stream()
                    .sorted((a, b) -> a.getDescription().compareToIgnoreCase(b.getDescription()))
                    .collect(Collectors.toList());
        } else if ("nameDesc".equals(sortBy)) {
            taskTypes = taskTypes.stream()
                    .sorted((a, b) -> b.getDescription().compareToIgnoreCase(a.getDescription()))
                    .collect(Collectors.toList());
        }

        model.addAttribute("taskTypes", taskTypes);
        model.addAttribute("keyword", keyword);
        model.addAttribute("sortBy", sortBy);
        addRoleToModel(model);

        return "tasktypes";
    }
}