package ua.edu.chnu.kkn.project2_2;

import org.springframework.ui.Model;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ua.edu.chnu.kkn.project2_2.dto.RegistrationRequest;
import ua.edu.chnu.kkn.project2_2.User;
import ua.edu.chnu.kkn.project2_2.UserRepository;

@Controller
public class RegistrationApiController {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public RegistrationApiController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute RegistrationRequest request, Model model) {
        if (userRepository.existsByUsername(request.getUsername())) {
            model.addAttribute("error", "Користувач з таким ім’ям вже існує.");
            return "register.jte";
        }

        User user = new User();
        user.setUsername(request.getUsername());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setRole(request.getRole());

        userRepository.save(user);

        return "redirect:/login";
    }
}