package com.assistant.server.service;

import com.assistant.server.converter.DummyConverter;
import com.assistant.server.dto.DummyDTO;
import com.assistant.server.infrastructure.entity.Dummy;
import com.assistant.server.infrastructure.repository.DummyRepository;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.mockito.Mockito.verifyNoMoreInteractions;

@RunWith(MockitoJUnitRunner.class)
public class DummyServiceTest {

	private static final Long ONE = 1L;

	@Mock
	private DummyRepository dummyRepository;

	@Mock
	private DummyConverter dummyConverter;

	@InjectMocks
	private DummyService dummyService;

	@Before
	public void setUp() {
		final Dummy dummy = buildDummy();
		final DummyDTO dummyDTO = buildDummyDTO();

		when(dummyRepository.findFirstBy()).thenReturn(dummy);
		when(dummyRepository.save(dummy)).thenReturn(dummy);

		when(dummyConverter.convertToDto(dummy)).thenReturn(dummyDTO);
		when(dummyConverter.convertToEntity(dummyDTO)).thenReturn(dummy);

		when(dummyRepository.findDummyById(ONE)).thenReturn(dummy);
	}

	@After
	public void tearDown() {
		verifyNoMoreInteractions(dummyRepository);
		verifyNoMoreInteractions(dummyConverter);
	}

	@Test
	public void shouldGetFirstDummy() {
		dummyService.getDummy();
		verify(dummyRepository).findFirstBy();
	}

	@Test
	public void shouldSaveDummy() {
		final DummyDTO dummyDTO = buildDummyDTO();
		final Dummy dummy = buildDummy();

		final DummyDTO actualDummyDTO = dummyService.saveDummy(dummyDTO);

		verify(dummyRepository).save(dummy);
		verify(dummyConverter).convertToDto(dummy);
		verify(dummyConverter).convertToEntity(dummyDTO);
		assertThat(actualDummyDTO).isEqualTo(dummyDTO);
	}

	@Test
	public void shouldUpdateDummy() {
		final DummyDTO dummyDTO = buildDummyDTO();
		final Dummy dummy = buildDummy();

		final DummyDTO actualDummyDTO = dummyService.updateDummy(ONE, dummyDTO);

		verify(dummyRepository).findDummyById(ONE);
		verify(dummyRepository).save(dummy);
		verify(dummyConverter).convertToDto(dummy);
		verify(dummyConverter).convertToEntity(dummyDTO);
		assertThat(actualDummyDTO).isEqualTo(dummyDTO);
	}

	private Dummy buildDummy() {
		return Dummy.builder()
			.id(ONE)
			.num(ONE)
			.build();
	}

	private DummyDTO buildDummyDTO() {
		return DummyDTO.builder()
			.id(ONE)
			.num(ONE)
			.build();
	}
}
