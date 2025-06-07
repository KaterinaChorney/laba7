package ua.edu.chnu.kkn.project2_2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TaskTypesController {

    private final TaskTypesRepository taskTypesRepository;

    public TaskTypesController(TaskTypesRepository taskTypesRepository) {
        this.taskTypesRepository = taskTypesRepository;
    }

    @GetMapping("/tasktypes")
    public String showTaskTypes(Model model) {
        model.addAttribute("taskTypes", taskTypesRepository.findAll());
        return "tasktypes";
    }
}