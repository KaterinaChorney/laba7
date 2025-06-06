package ua.edu.chnu.kkn.project2_2;

import jakarta.persistence.*;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "task_type")
public class TaskTypes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long taskTypeId;

    private String description;
    private Integer dailyPayment;

    @OneToMany(mappedBy = "taskType")
    private List<Task> tasks;
}
