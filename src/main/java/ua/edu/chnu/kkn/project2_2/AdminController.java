package ua.edu.chnu.kkn.project2_2;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final EmployeeRepository employeeRepository;
    private final TaskRepository taskRepository;
    private final TaskTypesRepository taskTypesRepository;

    public AdminController(EmployeeRepository employeeRepository, TaskRepository taskRepository,TaskTypesRepository taskTypesRepository) {
        this.employeeRepository = employeeRepository;
        this.taskRepository = taskRepository;
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
        model.addAttribute("employees", employeeRepository.findAll());
        model.addAttribute("taskTypes", taskTypesRepository.findAll());
        addRoleToModel(model);
        return "admin/createTask";
    }

    @PostMapping("/tasks/create")
    public String createTask(
            @RequestParam Long taskTypeId,
            @RequestParam Long employeeId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate
    ) {
        Task task = new Task();

        TaskTypes taskType = taskTypesRepository.findById(taskTypeId)
                .orElseThrow(() -> new RuntimeException("Task type not found"));
        Employee employee = employeeRepository.findById(employeeId)
                .orElseThrow(() -> new RuntimeException("Employee not found"));

        task.setTaskType(taskType);
        task.setEmployee(employee);
        task.setStartDate(startDate);

        taskRepository.save(task);

        return "redirect:/tasks";
    }

    @GetMapping("/tasks/edit/{taskId}")
    public String showEditTaskForm(@PathVariable Long taskId, Model model) {
        Task task = taskRepository.findById(taskId)
                .orElseThrow(() -> new RuntimeException("Task not found"));
        model.addAttribute("task", task);
        model.addAttribute("employees", employeeRepository.findAll());
        model.addAttribute("taskTypes", taskTypesRepository.findAll());
        addRoleToModel(model);
        return "admin/editTask";
    }

    @PostMapping("/tasks/edit")
    public String editTask(
            @RequestParam Long taskId,
            @RequestParam Long taskTypeId,
            @RequestParam Long employeeId,
            @RequestParam String startDate,
            @RequestParam(required = false) String endDate) {

        Task task = taskRepository.findById(taskId)
                .orElseThrow(() -> new RuntimeException("Task not found"));

        TaskTypes taskType = taskTypesRepository.findById(taskTypeId)
                .orElseThrow(() -> new RuntimeException("Task type not found"));

        Employee employee = employeeRepository.findById(employeeId)
                .orElseThrow(() -> new RuntimeException("Employee not found"));

        task.setTaskType(taskType);
        task.setEmployee(employee);
        task.setStartDate(LocalDate.parse(startDate));

        if (endDate != null && !endDate.isBlank()) {
            task.setEndDate(LocalDate.parse(endDate));
        } else {
            task.setEndDate(null);
        }

        taskRepository.save(task);

        return "redirect:/tasks";
    }
}