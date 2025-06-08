package ua.edu.chnu.kkn.project2_2;

import ua.edu.chnu.kkn.project2_2.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {}