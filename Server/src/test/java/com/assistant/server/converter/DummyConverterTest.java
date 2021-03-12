package com.assistant.server.converter;

import com.assistant.server.converter.DummyConverter;
import com.assistant.server.dto.DummyDTO;
import com.assistant.server.infrastructure.entity.Dummy;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.BlockJUnit4ClassRunner;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(BlockJUnit4ClassRunner.class)
public class DummyConverterTest {

	private static final Long ONE = 1L;

	private static final Long TWO = 2L;

	private static final Long FIVE = 5L;

	private DummyConverter dummyConverter;

	@Before
	public void setUp() {
		dummyConverter = new DummyConverter();
	}

	@Test
	public void shouldConvertToDto() {
		final DummyDTO expectedDummyDTO =
			buildDummyDTO();

		final Dummy toConvert = Dummy.builder()
			.id(ONE)
			.num(ONE)
			.build();

		final DummyDTO actualDummyDTO = dummyConverter.convertToDto(toConvert);

		assertThat(actualDummyDTO)
			.isEqualTo(expectedDummyDTO);
	}

	@Test
	public void shouldConvertToEntity() {
		final  Dummy expectedDummy = buildDummy();

		final DummyDTO toConvert = DummyDTO.builder()
			.id(TWO)
			.num(TWO)
			.build();

		final Dummy actualDummy = dummyConverter.convertToEntity(toConvert);

		assertThat(actualDummy)
			.isEqualTo(expectedDummy);
	}

	@Test
	public void shouldConvertToDtoAndInvalidate() {
		final DummyDTO expectedDummyDTO = buildDummyDTO();

		final Dummy toConvert = Dummy.builder()
			.id(FIVE)
			.num(FIVE)
			.build();

		final DummyDTO actualDummyDTO = dummyConverter.convertToDto(toConvert);

		assertThat(actualDummyDTO)
			.isNotEqualTo(expectedDummyDTO);
	}

	@Test
	public void shouldConvertToEntityAndInvalidate() {
		final  Dummy expectedDummy = buildDummy();

		final DummyDTO toConvert = DummyDTO.builder()
			.id(FIVE)
			.num(FIVE)
			.build();

		final Dummy actualDummy = dummyConverter.convertToEntity(toConvert);

		assertThat(actualDummy)
			.isNotEqualTo(expectedDummy);
	}

	private DummyDTO buildDummyDTO() {
		return DummyDTO.builder()
			.id(ONE)
			.num(ONE)
			.build();
	}

	private Dummy buildDummy() {
		return Dummy.builder()
			.id(TWO)
			.num(TWO)
			.build();
	}
}
