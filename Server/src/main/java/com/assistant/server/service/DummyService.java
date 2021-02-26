package com.assistant.server.service;

import com.assistant.server.infrastructure.repository.DummyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DummyService {

	private final DummyRepository dummyRepository;

	public Long getDummyNumber() {
		return dummyRepository.findFirstBy().getNum();
	}
}
