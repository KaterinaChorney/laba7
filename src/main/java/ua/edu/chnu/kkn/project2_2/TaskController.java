package ua.edu.chnu.kkn.project2_2;

import ua.edu.chnu.kkn.project2_2.TaskRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TaskController {

    private final TaskRepository taskRepository;

    public TaskController(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
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
}