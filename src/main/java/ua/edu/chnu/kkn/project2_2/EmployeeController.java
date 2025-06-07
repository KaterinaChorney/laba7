package ua.edu.chnu.kkn.project2_2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
    public class EmployeeController {

        private final EmployeeRepository employeeRepository;

        public EmployeeController(EmployeeRepository employeeRepository) {
            this.employeeRepository = employeeRepository;
        }

        @GetMapping("/employees")
        public String showEmployees(Model model) {
            model.addAttribute("employees", employeeRepository.findAll());
            return "employee";
        }
    }