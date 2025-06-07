package ua.edu.chnu.kkn.project2_2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/index")
    public String home() {
        return "index";
    }
}

