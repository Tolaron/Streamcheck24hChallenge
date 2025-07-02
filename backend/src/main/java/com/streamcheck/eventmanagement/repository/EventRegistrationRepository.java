package com.streamcheck.eventmanagement.repository;

import com.streamcheck.eventmanagement.model.EventRegistration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

// Repository zur ver waltung von Event-Registrierungen
@Repository
public interface EventRegistrationRepository extends JpaRepository<EventRegistration, Long>
{
    // Alle registrierungen für einen bestimmten User abrufen
    List<EventRegistration> findByUserId(Long userId);
}