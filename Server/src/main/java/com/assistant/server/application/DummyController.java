package com.assistant.server.application;

import com.assistant.server.service.DummyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dummy")
public class DummyController {
	private final DummyService dummyService;

	@GetMapping
	public ResponseEntity<Long> getDummyLong(){
		return ResponseEntity.ok(dummyService.getDummyNumber());
	}
}
