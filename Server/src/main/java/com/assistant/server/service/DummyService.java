package com.assistant.server.service;

import com.assistant.server.infrastructure.entity.Dummy;
import com.assistant.server.infrastructure.repository.DummyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DummyService {

	private final DummyRepository repository;

	private final DummyConverter dummyConverter;

	public Dummy getDummy() {
		return repository.findFirstBy();
	}

	public DummyDTO saveDummy(DummyDTO dummyDTO) {
		return dummyConverter.convertToDto(
			repository.save(
				dummyConverter.convertToEntity(dummyDTO)
			)
		);
	}

	public DummyDTO updateDummy(final Long id, final DummyDTO dummyDto) {

		final Dummy dummyById = repository.findDummyById(id);

		final Dummy convertedDummy = dummyConverter.convertToEntity(dummyDto);
		dummyById.setNum(convertedDummy.getNum());

		return dummyConverter.convertToDto(repository.save(dummyById));
	}
}
