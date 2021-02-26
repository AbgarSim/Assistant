package com.assistant.server.infrastructure.repository;

import com.assistant.server.infrastructure.entity.Dummy;
import org.springframework.data.repository.CrudRepository;

public interface DummyRepository extends CrudRepository<Dummy,Long> {

	Dummy findFirstBy();
}
