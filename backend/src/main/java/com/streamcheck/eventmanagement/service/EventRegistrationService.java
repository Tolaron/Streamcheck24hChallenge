package com.streamcheck.eventmanagement.service;

import com.streamcheck.eventmanagement.model.Event;
import com.streamcheck.eventmanagement.model.EventRegistration;
import com.streamcheck.eventmanagement.model.User;
import com.streamcheck.eventmanagement.repository.EventRegistrationRepository;
import com.streamcheck.eventmanagement.repository.EventRepository;
import com.streamcheck.eventmanagement.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

// Service für Registrierung von usern zu events
@Service
public class EventRegistrationService
{
    private final EventRepository eventRepository;
    private final UserRepository userRepository;
    private final EventRegistrationRepository registrationRepository;

    public EventRegistrationService(EventRepository eventRepository, UserRepository userRepository, EventRegistrationRepository registrationRepository)
    {
        this.eventRepository = eventRepository;
        this.userRepository = userRepository;
        this.registrationRepository = registrationRepository;
    }

    // Registrierung eines Benutzer zu einem Event
    public EventRegistration registerUser(Long eventId, Long userId)
    {
        Event event = eventRepository.findById(eventId).orElseThrow(() -> new RuntimeException("Event not found"));

        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));

        EventRegistration registration = new EventRegistration();
        registration.setEventId(event.getId());
        registration.setUserId(user.getId());
        registration.setRegistrationDate(LocalDateTime.now());

        return registrationRepository.save(registration);
    }

    // Alle registrierungen eines users abrufen
    public List<EventRegistration> getRegistrationsForUser(Long userId)
    {
        return registrationRepository.findByUserId(userId);
    }
}