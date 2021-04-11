package com.assistant.server.application;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/hb")
@CrossOrigin(originPatterns = "http://*")
public class HeartBeatController {

	@GetMapping
	public ResponseEntity<Boolean> pulse() {
		return ResponseEntity.ok(Boolean.TRUE);
	}
}
