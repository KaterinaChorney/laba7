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

    @Transient
    public String getFullName() {
        StringBuilder fullName = new StringBuilder();

        if (lastName != null) {
            fullName.append(lastName).append(" ");
        }
        if (firstName != null) {
            fullName.append(firstName).append(" ");
        }
        if (middleName != null) {
            fullName.append(middleName);
        }

        return fullName.toString().trim();
    }
    public Long getEmployeeId() {
        return employeeId;
    }

    @OneToMany(mappedBy = "employee")
    private List<Task> tasks;

    @OneToOne(mappedBy = "employee")
    private User user;
}