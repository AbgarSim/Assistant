package com.assistant.server.converter;

import com.assistant.server.dto.DummyDTO;
import com.assistant.server.infrastructure.entity.Dummy;
import org.springframework.stereotype.Component;

@Component
public class DummyConverter {

	public DummyDTO convertToDto(Dummy dummy) {
		return DummyDTO.builder()
			.id(dummy.getId())
			.num(dummy.getNum())
			.build();
	}

	public Dummy convertToEntity(DummyDTO dummyDto) {
		return Dummy.builder()
			.id(dummyDto.getId())
			.num(dummyDto.getNum())
			.build();
	}
}
