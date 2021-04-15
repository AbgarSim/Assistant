package com.assistant.server.infrastructure.repository;

import com.assistant.server.infrastructure.entity.Role;
import org.springframework.data.repository.CrudRepository;

public interface RoleRepository extends CrudRepository<Role, Long> {

	Role findByName(String name);
}
