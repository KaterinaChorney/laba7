package ua.edu.chnu.kkn.project2_2;

import ua.edu.chnu.kkn.project2_2.Employee;
import org.springframework.data.repository.CrudRepository;

public interface EmployeeRepository extends CrudRepository<Employee, Long> {
}