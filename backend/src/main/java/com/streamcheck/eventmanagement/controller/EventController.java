package com.streamcheck.eventmanagement.controller;

import com.streamcheck.eventmanagement.model.Event;
import com.streamcheck.eventmanagement.service.EventService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

// REST-Controller für Event-bezogene API-Endpunkte
@RestController
@RequestMapping("/api/events")                                  // Basis-URL für alle Event-Endpunkte
public class EventController
{
    private final EventService eventService;

    //Konstruktorinjektion des EventService
    public EventController(EventService eventService)
    {
        this.eventService = eventService;
    }

    //GET /api/events - Liefert alle Events
    @GetMapping
    public ResponseEntity<List<Event>> getAllEvents()
    {
        List<Event> events = eventService.getAllEvents();
        return ResponseEntity.ok(events);
    }

    // GET /api/events/{id} - Liefert ein Event nach ID
    @GetMapping("/{id}")
    public ResponseEntity<Event> getEventById(@PathVariable Long id)
    {
        return eventService.getEventById(id).map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    // POST /api/events - Erstellt ein neues Event
    @PostMapping
    public ResponseEntity<Event> createEvent(@RequestBody Event event)
    {
        Event savedEvent = eventService.createEvent(event);
        return ResponseEntity.ok(savedEvent);
    }

    // DELETE /api/events/{id} - Löscht ein Event nach ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteEvent(@PathVariable Long id)
    {
        boolean deleted = eventService.deleteEvent(id);
        if(deleted)
        {
            return ResponseEntity.noContent().build();
        }
        else
        {
            return ResponseEntity.notFound().build();
        }
    }
}