package com.streamcheck.eventmanagement.controller;

import com.streamcheck.eventmanagement.model.EventRegistration;
import com.streamcheck.eventmanagement.service.EventRegistrationService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

// REST-Controller für Registrierungen
@RestController
@RequestMapping("/api")
public class EventRegistrationController
{
    private final EventRegistrationService registrationService;

    public EventRegistrationController(EventRegistrationService registrationService)
    {
        this.registrationService = registrationService;
    }

    // POST /api/events/{eventId}/register - registriert einen User zu einem Event
    @PostMapping("/events/{eventId}/register")
    public ResponseEntity<EventRegistration> registerUserToEvent(@PathVariable Long eventId, @RequestParam Long userId)
    {
        EventRegistration registration = registrationService.registerUser(eventId, userId);
        return ResponseEntity.ok(registration);
    }

    // GET /api/users/{userId}//registrations - gibt alle Registrierungen eines Users zurück
    @GetMapping("/users/{userId}/registrations")
    public ResponseEntity<List<EventRegistration>> getRegistrationsForUser(@PathVariable Long userId)
    {
        List<EventRegistration> registrations = registrationService.getRegistrationsForUser(userId);
        return ResponseEntity.ok(registrations);
    }
}