package ua.edu.chnu.kkn.project2_2;

import ua.edu.chnu.kkn.project2_2.EmployeeRepository;
import ua.edu.chnu.kkn.project2_2.TaskRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
            return "index";
        }

    @GetMapping("/tasks")
    public String getTasks(Model model) {
        model.addAttribute("tasks", taskRepository.findAll());
        return "tasks";
    }

    @GetMapping("/admin/tasks/create")
    public String showCreateTaskForm(Model model) {
        model.addAttribute("employees", employeeRepository.findAll());
        return "admin/createTask";
    }
}