package com.assistant.server.infrastructure.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.Collection;

@Data
@Entity
@Builder
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "t_user")
public class User {


		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		private Long id;

		private String firstName;
		private String lastName;
		private String email;
		private String password;
		private boolean enabled;

		@ManyToMany
		@JoinTable(
			name = "users_roles",
			joinColumns = @JoinColumn(
				name = "user_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(
				name = "role_id", referencedColumnName = "id"))
		private Collection<Role> roles;
	}

