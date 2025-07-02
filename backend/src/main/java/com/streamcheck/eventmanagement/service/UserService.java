package com.streamcheck.eventmanagement.service;

import com.streamcheck.eventmanagement.dto.UserLoginRequest;
import com.streamcheck.eventmanagement.dto.UserRegisterRequest;
import com.streamcheck.eventmanagement.model.User;
import com.streamcheck.eventmanagement.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

// Diese Serviceklasse kapselt die Geschäftslogik für Benutzeraktionen
@Service
public class UserService {

    private final UserRepository userRepository;

    // Konstruktor-Injektion des Repositories
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Registriert einen neuen Benutzer
    public User register(UserRegisterRequest request) 
    {
        if (userRepository.findByEmail(request.getEmail()).isPresent())
        {
            throw new RuntimeException("User with email already exists");
        }
        User user = new User();
        user.setUsername(request.getUsername());
        user.setEmail(request.getEmail());
        user.setRole(User.Role.valueOf(request.getRole()));
        return userRepository.save(user);
    }

    // Dummy-Login nur über E-Mail
    public Optional<User> login(UserLoginRequest request) {
        return userRepository.findByEmail(request.getEmail());
    }
}
