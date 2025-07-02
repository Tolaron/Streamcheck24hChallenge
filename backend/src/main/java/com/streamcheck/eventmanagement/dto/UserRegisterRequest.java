package com.streamcheck.eventmanagement.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;


// DTO für die Registrierung eines neuen Benutzers

public class UserRegisterRequest
{
    @NotBlank(message = "Username must not be blank")
    @Size(min = 3, max = 30, message = "Username must be between 3 and 30 characters")
    private String username;

    @NotBlank(message = "Email must not be blank")
    @Email(message = "Email must be valid")
    private String email;

    @NotNull(message = "Role must not be null")
    private String role;

    // Getter
    public String getUsername() { return username; }
    public String getEmail() { return email; }
    public String getRole() { return role; }

    // Setter
    public void setUsername(String username) { this.username = username; }
    public void setEmail(String email) { this.email = email; }
    public void setRole(String role) { this.role = role; }
}
