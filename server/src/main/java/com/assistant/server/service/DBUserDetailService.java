package com.assistant.server.service;

import com.assistant.server.infrastructure.entity.Privilege;
import com.assistant.server.infrastructure.entity.Role;
import com.assistant.server.infrastructure.entity.User;
import com.assistant.server.infrastructure.repository.RoleRepository;
import com.assistant.server.infrastructure.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DBUserDetailService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Override
	public UserDetails loadUserByUsername(String email)
		throws UsernameNotFoundException
	{

		User user = userRepository.findByEmail(email);
		if (user == null) {
			return new org.springframework.security.core.userdetails.User(
				" ", " ", true, true, true, true,
				getAuthorities(Arrays.asList(
					roleRepository.findByName("ROLE_USER"))));
		}

		return new org.springframework.security.core.userdetails.User(
			user.getEmail(), user.getPassword(), user.isEnabled(), true, true,
			true, getAuthorities((List<Role>) user.getRoles()));
	}



	private List<? extends GrantedAuthority> getAuthorities(List<Role> roles) {

		return getGrantedAuthorities(getPrivileges(roles));
	}

	private List<String> getPrivileges(List<Role> roles) {

		List<String> privileges = new ArrayList<>();
		List<Privilege> collection = new ArrayList<>();
		for (Role role : roles) {
			collection.addAll(role.getPrivileges());
		}
		for (Privilege item : collection) {
			privileges.add(item.getName());
		}
		return privileges;
	}

	private List<GrantedAuthority> getGrantedAuthorities(List<String> privileges) {
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (String privilege : privileges) {
			authorities.add(new SimpleGrantedAuthority(privilege));
		}
		return authorities;
	}

}
