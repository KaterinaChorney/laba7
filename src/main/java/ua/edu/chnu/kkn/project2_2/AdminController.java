package ua.edu.chnu.kkn.project2_2;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final EmployeeRepository employeeRepository;
    private final TaskRepository taskRepository;

    public AdminController(EmployeeRepository employeeRepository, TaskRepository taskRepository) {
        this.employeeRepository = employeeRepository;
        this.taskRepository = taskRepository;
    }

    private void addRoleToModel(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String role = auth.getAuthorities().stream()
                .findFirst()
                .map(a -> a.getAuthority())
                .orElse("");
        model.addAttribute("role", role);
    }

    @GetMapping("/employees/create")
    public String showCreateEmployeeForm(Model model) {
        model.addAttribute("employee", new Employee());
        addRoleToModel(model);
        return "admin/createEmployee";
    }

    @PostMapping("/employees/create")
    public String createEmployee(@ModelAttribute Employee employee) {
        employeeRepository.save(employee);
        return "redirect:/employees";
    }

    @GetMapping("/tasks/create")
    public String showCreateTaskForm(Model model) {
        model.addAttribute("task", new Task());
        addRoleToModel(model);
        return "/createTask";
    }

    @PostMapping("/tasks/create")
    public String createTask(@ModelAttribute Task task) {
        taskRepository.save(task);
        return "redirect:/tasks";
    }
}