package ua.edu.chnu.kkn.project2_2;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TaskTypesRepository extends JpaRepository<TaskTypes, Long> {

    List<TaskTypes> findAllByOrderByDescriptionAsc();

    List<TaskTypes> findAllByOrderByDescriptionDesc();

    @Query("SELECT t FROM TaskTypes t WHERE " +
            "LOWER(t.description) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<TaskTypes> findByKeyword(@Param("keyword") String keyword);
}