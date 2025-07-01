package com.streamcheck.eventmanagement.dto;

// DTO für Login-Anfrage per E-Mail (ohne Passwort)

public class UserLoginRequest
{
    private String email;

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
