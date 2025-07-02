package com.streamcheck.eventmanagement.repository;

import com.streamcheck.eventmanagement.model.Event;

import org.springframework.data.jpa.repository.JpaRepository;

// eventRepository erlaubt CRUD-Operationen auf der Event-Tabelle

public interface EventRepository extends JpaRepository<Event, Long>
{
    // kann leer bleiben, da es von JpaRepository erbt (stellt CRUD-Operationen zur verfügung)
}