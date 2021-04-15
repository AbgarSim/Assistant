package com.assistant.server.infrastructure.repository;

import com.assistant.server.infrastructure.entity.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {

	User findByEmail(String email);
}
