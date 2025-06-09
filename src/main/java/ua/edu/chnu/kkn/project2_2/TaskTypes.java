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

    public Long getTaskTypeId() {
        return taskTypeId;
    }

    public String getDescription() {
        return description;
    }

    @OneToMany(mappedBy = "taskType")
    private List<Task> tasks;
}