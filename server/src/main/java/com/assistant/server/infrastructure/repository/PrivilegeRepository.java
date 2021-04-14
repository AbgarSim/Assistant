package com.assistant.server.infrastructure.repository;

import com.assistant.server.infrastructure.entity.Privilege;
import org.springframework.data.repository.CrudRepository;

public interface PrivilegeRepository extends CrudRepository<Privilege, Long> {

	Privilege findByName(String name);

}
