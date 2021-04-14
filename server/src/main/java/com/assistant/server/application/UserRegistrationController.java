package com.assistant.server.application;

import com.assistant.server.dto.UserAccountDTO;
import com.assistant.server.infrastructure.entity.User;
import com.assistant.server.infrastructure.repository.RoleRepository;
import com.assistant.server.infrastructure.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;

@RestController
public class UserRegistrationController {

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	UserRepository userRepository;

	public User registerNewUserAccount(UserAccountDTO accountDto) {

		User user = new User();

		user.setFirstName(accountDto.getFirstName());
		user.setLastName(accountDto.getLastName());
		user.setPassword(passwordEncoder.encode(accountDto.getPassword()));
		user.setEmail(accountDto.getEmail());

		user.setRoles(Arrays.asList(roleRepository.findByName("ROLE_USER")));
		return userRepository.save(user);
	}
}
