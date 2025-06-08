package ua.edu.chnu.kkn.project2_2;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.edu.chnu.kkn.project2_2.Task;

public interface TaskRepository extends JpaRepository<Task, Long> {

    List<Task> findAllByOrderByStartDateAsc();

    List<Task> findAllByOrderByStartDateDesc();

    @Query("SELECT t FROM Task t ORDER BY t.employee.lastName ASC")
    List<Task> findAllOrderByEmployeeLastNameAsc();

    @Query("SELECT t FROM Task t ORDER BY t.employee.lastName DESC")
    List<Task> findAllOrderByEmployeeLastNameDesc();
}
