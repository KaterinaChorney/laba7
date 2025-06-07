package ua.edu.chnu.kkn.project2_2;

import org.springframework.data.repository.CrudRepository;
import ua.edu.chnu.kkn.project2_2.User;

import java.util.Optional;

public interface UserRepository extends CrudRepository<User, Long> {
    boolean existsByUsername(String username);
    Optional<User> findByUsername(String username);
}