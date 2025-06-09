package ua.edu.chnu.kkn.project2_2;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    private final EmployeeRepository employeeRepository;

    public EmployeeController(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    private void addRoleToModel(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String role = auth.getAuthorities().stream()
                .findFirst()
                .map(a -> a.getAuthority())
                .orElse("");
        model.addAttribute("role", role);
    }

    @GetMapping
    public String listEmployees(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String sortBy,
            Model model
    ) {
        List<Employee> employees = employeeRepository.findAll();

        if (keyword != null && !keyword.isEmpty()) {
            String lowerKeyword = keyword.toLowerCase();
            employees = employees.stream()
                    .filter(e -> e.getLastName().toLowerCase().contains(lowerKeyword)
                            || e.getFirstName().toLowerCase().contains(lowerKeyword)
                            || (e.getMiddleName() != null && e.getMiddleName().toLowerCase().contains(lowerKeyword)))
                    .collect(Collectors.toList());

        }

        if ("lastNameAsc".equals(sortBy)) {
            employees = employees.stream()
                    .sorted((a, b) -> a.getLastName().compareToIgnoreCase(b.getLastName()))
                    .collect(Collectors.toList());
        } else if ("lastNameDesc".equals(sortBy)) {
            employees = employees.stream()
                    .sorted((a, b) -> b.getLastName().compareToIgnoreCase(a.getLastName()))
                    .collect(Collectors.toList());
        } else if ("salaryAsc".equals(sortBy)) {
            employees = employees.stream()
                    .sorted((a, b) -> Double.compare(
                            a.getSalary() != null ? a.getSalary() : 0.0,
                            b.getSalary() != null ? b.getSalary() : 0.0))
                    .collect(Collectors.toList());
        } else if ("salaryDesc".equals(sortBy)) {
            employees = employees.stream()
                    .sorted((a, b) -> Double.compare(
                            b.getSalary() != null ? b.getSalary() : 0.0,
                            a.getSalary() != null ? a.getSalary() : 0.0))
                    .collect(Collectors.toList());
        }

        model.addAttribute("employees", employees);
        model.addAttribute("keyword", keyword);
        model.addAttribute("sortBy", sortBy);
        addRoleToModel(model);

        return "employee";
    }
}