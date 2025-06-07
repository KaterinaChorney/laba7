package ua.edu.chnu.kkn.project2_2;

import org.springframework.ui.Model;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ua.edu.chnu.kkn.project2_2.dto.RegistrationRequest;
import ua.edu.chnu.kkn.project2_2.User;
import ua.edu.chnu.kkn.project2_2.UserRepository;
import ua.edu.chnu.kkn.project2_2.Employee;
import ua.edu.chnu.kkn.project2_2.EmployeeRepository;

@Controller
public class RegistrationApiController {

    private final UserRepository userRepository;
    private final EmployeeRepository employeeRepository;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public RegistrationApiController(UserRepository userRepository,EmployeeRepository employeeRepository) {
        this.userRepository = userRepository;
        this.employeeRepository = employeeRepository;
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute RegistrationRequest request, Model model) {
        if (userRepository.existsByUsername(request.getUsername())) {
            model.addAttribute("error", "Користувач з таким ім’ям вже існує.");
            return "register.jte";
        }

        Employee employee = new Employee();
        employee.getFullName();
        employeeRepository.save(employee);

        User user = new User();
        user.setUsername(request.getUsername());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setRole(request.getRole());
        user.setEmployee(employee);

        userRepository.save(user);

        return "redirect:/login";
    }
}