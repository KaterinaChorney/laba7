package ua.edu.chnu.kkn.project2_2;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    List<Employee> findAllByOrderByLastNameAsc();

    List<Employee> findAllByOrderByLastNameDesc();

    List<Employee> findAllByOrderBySalaryAsc();

    List<Employee> findAllByOrderBySalaryDesc();

    @Query("SELECT e FROM Employee e WHERE " +
            "LOWER(e.lastName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(e.firstName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(e.middleName) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Employee> findByKeyword(@Param("keyword") String keyword);
}