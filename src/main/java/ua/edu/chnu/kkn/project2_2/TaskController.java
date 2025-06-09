package ua.edu.chnu.kkn.project2_2;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestParam;
import ua.edu.chnu.kkn.project2_2.EmployeeRepository;
import ua.edu.chnu.kkn.project2_2.TaskRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Comparator;
import java.util.List;

@Controller
public class TaskController {

    private final TaskRepository taskRepository;
    private final EmployeeRepository employeeRepository;

    public TaskController(TaskRepository taskRepository,EmployeeRepository employeeRepository) {
        this.taskRepository = taskRepository;
        this.employeeRepository = employeeRepository;
    }
        @GetMapping("/")
        public String home() {
            return "redirect:/tasks";
        }

    @GetMapping("/tasks")
    public String viewTasks(@RequestParam(required = false) String sortBy,
                            @RequestParam(required = false) String keyword,
                            Model model) {

        List<Task> tasks;

        if (keyword != null && !keyword.isEmpty()) {
            tasks = taskRepository.findByKeyword(keyword);
        } else {
            tasks = taskRepository.findAll();
        }

        if ("dateAsc".equals(sortBy)) {
            tasks.sort(Comparator.comparing(Task::getStartDate));
        } else if ("dateDesc".equals(sortBy)) {
            tasks.sort(Comparator.comparing(Task::getStartDate).reversed());
        } else if ("nameAsc".equals(sortBy)) {
            tasks.sort(Comparator.comparing(t -> t.getEmployee().getLastName()));
        } else if ("nameDesc".equals(sortBy)) {
            tasks.sort(Comparator.comparing((Task t) -> t.getEmployee().getLastName()).reversed());
        }

        model.addAttribute("tasks", tasks);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("keyword", keyword);

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String role = auth.getAuthorities().stream()

                .findFirst()
                .map(a -> a.getAuthority())
                .orElse("");
        model.addAttribute("role", role);

        return "tasks";
    }
}