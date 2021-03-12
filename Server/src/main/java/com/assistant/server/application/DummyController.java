package com.assistant.server.application;

import com.assistant.server.infrastructure.entity.Dummy;
import com.assistant.server.service.DummyDTO;
import com.assistant.server.service.DummyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/dummy")
public class DummyController {

	private final DummyService service;

	@GetMapping
	public ResponseEntity<Dummy> getDummy() {
		return ResponseEntity.ok(service.getDummy());
	}

	@PostMapping("/add")
	public ResponseEntity<DummyDTO> addDummy(@RequestBody DummyDTO dummyDTO) {
		return ResponseEntity.ok(service.saveDummy(dummyDTO));
	}

	@PutMapping("/update/{id}")
	public ResponseEntity<DummyDTO> updateDummy(@RequestBody DummyDTO dummyDTO, @PathVariable("id") Long id) {
		return ResponseEntity.ok(service.updateDummy(id, dummyDTO));
	}
}