package com.streamcheck.eventmanagement.controller;

import com.streamcheck.eventmanagement.dto.UserLoginRequest;
import com.streamcheck.eventmanagement.dto.UserRegisterRequest;
import com.streamcheck.eventmanagement.model.User;
import com.streamcheck.eventmanagement.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;


@RestController
@RequestMapping("/api/users")                                                           // Basisroute für User-bezogene Endpunkte
public class UserController
{
    private final UserService userService;

    public UserController(UserService userService)
    {
        this.userService = userService;
    }

    // Registriert einen neuen Benutzer
    @PostMapping("/register")
    public ResponseEntity<User> register(@Valid @RequestBody UserRegisterRequest request)
    {
        User user = userService.register(request);
        return ResponseEntity.ok(user);
    }

    // Prüft ob ein Benutzer mit dieser E-Mail existiert (simples Login)
    @PostMapping("/login")
public ResponseEntity<Object> login(@RequestBody UserLoginRequest request)
{
    return userService.login(request)
        .<ResponseEntity<Object>>map(ResponseEntity::ok)
        .orElseGet(() -> ResponseEntity.status(404).body("User not found"));
}

}
