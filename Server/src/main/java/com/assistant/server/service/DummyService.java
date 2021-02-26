package com.assistant.server.service;

import com.assistant.server.infrastructure.entity.Dummy;
import com.assistant.server.infrastructure.repository.DummyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DummyService {

	private final DummyRepository repository;

	public Long getDummyNumber() {
		return repository.findFirstBy().getNum();
	}

	public boolean exists(Dummy dummy) {
		return repository.existsById(dummy.getId());
	}

	public Dummy saveDummy(Dummy dummy) {
		return repository.save(dummy);
	}
}
