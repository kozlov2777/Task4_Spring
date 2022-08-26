package ua.com.kozlov2777.task4_spring.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kozlov2777.task4_spring.models.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
