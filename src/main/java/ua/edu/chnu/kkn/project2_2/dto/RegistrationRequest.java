package ua.edu.chnu.kkn.project2_2.dto;

import lombok.Data;

@Data
public class RegistrationRequest {
    private String username;
    private String password;
    private String role;
}