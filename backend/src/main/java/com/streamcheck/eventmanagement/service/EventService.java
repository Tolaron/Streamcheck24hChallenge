package com.streamcheck.eventmanagement.service;

import com.streamcheck.eventmanagement.model.Event;
import com.streamcheck.eventmanagement.repository.EventRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service        // Spring Service-Komponente
public class EventService
{
    private final EventRepository eventRepository;

    // konstruktorInjetion des Repos
    public EventService(EventRepository eventRepository)
    {
        this.eventRepository = eventRepository;
    }   

    // gibt alle Events zurück
    public List<Event> getAllEvents()
    {
        return eventRepository.findAll();
    }

    // gibt ein event anhand der id zurück
    public Optional<Event> getEventById(Long id)
    {
        return eventRepository.findById(id);
    }

    // speichert ein neues Event
    public Event createEvent(Event event)
    {
        return eventRepository.save(event);
    }

    // löscht ein event anhand der ID und gibt zurück ob erfolgreich war
    public boolean deleteEvent(Long id)
    {
        if(eventRepository.existsById(id))
        {
            eventRepository.deleteById(id);
            return true;
        }
        else
        {
            return false;
        }
    }
}