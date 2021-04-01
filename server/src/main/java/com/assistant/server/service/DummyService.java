package com.assistant.server.service;

import com.assistant.server.converter.DummyConverter;
import com.assistant.server.dto.DummyDTO;
import com.assistant.server.infrastructure.entity.Dummy;
import com.assistant.server.infrastructure.repository.DummyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
@RequiredArgsConstructor
public class DummyService {

	private final DummyRepository repository;

	private final DummyConverter dummyConverter;

	public Dummy getDummy() {
		return repository.findFirstBy();
	}

	public List<Dummy> getDummyList() {
		return StreamSupport
			.stream(repository.findAll().spliterator(), false)
			.collect(Collectors.toList());
	}

	public DummyDTO saveDummy(DummyDTO dummyDTO) {
		return dummyConverter.convertToDto(
			repository.save(dummyConverter.convertToEntity(dummyDTO))
		);
	}

	public DummyDTO updateDummy(final Long id, final DummyDTO dummyDto) {
		final Dummy dummyById = repository.findDummyById(id);
		final Dummy convertedDummy = dummyConverter.convertToEntity(dummyDto);

		dummyById.setNum(convertedDummy.getNum());

		return dummyConverter.convertToDto(repository.save(dummyById));
	}
}
