package com.streamcheck.eventmanagement.service;

import com.streamcheck.eventmanagement.dto.UserRegisterRequest;
import com.streamcheck.eventmanagement.model.User;
import com.streamcheck.eventmanagement.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.fail;
import static org.mockito.Mockito.*;

class UserServiceTest
{
    private UserRepository userRepository;
    private UserService userService;

    @BeforeEach
    void setUp()
    {
        userRepository = mock(UserRepository.class);                    // repository wird gemockt
        userService = new UserService(userRepository);                  // UserService mit Mock initialisieren
    }

    @Test
    void register_shouldSaveNewUser()
    {
        // Setup: Registrierung anfordern
        UserRegisterRequest request = new UserRegisterRequest();
        request.setUsername("griseo");
        request.setEmail("griseo@mail.com");
        request.setRole("ORGANIZER");

        // Repository gibt keinene vorhandenen Nutzer zurück
        when(userRepository.findByEmail("griseo@mail.com")).thenReturn(Optional.empty());

        // Repository gibt gespeicherten Nutzer zurück
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> invocation.getArgument(0));

        // Aktion: Registrierung durchführen
        User result = userService.register(request);

        // Überprüfung: Ein Benutzer wurdew gespeichert
        ArgumentCaptor<User> userCaptor = ArgumentCaptor.forClass(User.class);
        verify(userRepository).save(userCaptor.capture());

        User savedUser = userCaptor.getValue();
        assertThat(savedUser.getUsername()).isEqualTo("griseo");
        assertThat(savedUser.getEmail()).isEqualTo("griseo@mail.com");
        assertThat(savedUser.getRole()).isEqualTo(User.Role.ORGANIZER);

        // Ergebnis muss zurückgegeben worden sein
        assertThat(result).isNotNull();
        assertThat(result.getId()).isNull();        // da kein echter DB-Save
    }

    @Test
    void register_shouldThrowExceptionIfEmailExists()
    {
        // Setup: Email bereits vergeben
        UserRegisterRequest request = new UserRegisterRequest();
        request.setUsername("bob");
        request.setEmail("bob@mail.com");
        request.setRole("PARTICIPANT");

        when(userRepository.findByEmail("bob@mail.com")).thenReturn(Optional.of(new User()));

        // Aktion und Prüfung: exception erwartet
        try
        {
            userService.register(request);
            fail("Expected RuntimeException was not thrown");
        }
        catch(RuntimeException ex)
        {
            assertThat(ex.getMessage()).contains("already exists");
        }

        // repository darf nicht erneut speichern
        verify(userRepository, never()).save(any());
    }
}