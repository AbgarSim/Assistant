package com.assistant.server.application;

import com.assistant.server.infrastructure.entity.Dummy;
import com.assistant.server.service.DummyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dummy")
public class DummyController {

	private final DummyService service;

	@GetMapping
	public ResponseEntity<Long> getDummyLong() {
		return ResponseEntity.ok(service.getDummyNumber());
	}

	@PostMapping("/add")
	public ResponseEntity<Object> addDummy(@RequestBody Dummy dummy) {
		if (service.exists(dummy))
			return ResponseEntity.badRequest().body("Dummy already exists!");
		String msg = service.saveDummy(dummy) + " Successfully created!";
		return ResponseEntity.ok(msg);
	}
}
