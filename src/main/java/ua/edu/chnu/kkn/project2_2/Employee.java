package ua.edu.chnu.kkn.project2_2;

import jakarta.persistence.*;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "employee")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long employeeId;

    private String lastName;
    private String firstName;
    private String middleName;
    private Integer salary;

    @OneToMany(mappedBy = "employee")
    private List<Task> tasks;
}