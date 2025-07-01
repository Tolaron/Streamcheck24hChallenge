package com.streamcheck.eventmanagement.repository;

import com.streamcheck.eventmanagement.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

// Repository für CRUD-Zugriff auf die User-Tabelle
public interface UserRepository extends JpaRepository<User, Long>
{
    Optional<User> findByEmail(String email);
}
