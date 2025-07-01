package com.streamcheck.eventmanagement.dto;

// DTO für die Registrierung eines neuen Benutzers

public class UserRegisterRequest
{
    private String username;
    private String email;
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
