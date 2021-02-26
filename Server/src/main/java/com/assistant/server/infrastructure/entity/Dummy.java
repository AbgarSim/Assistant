package com.assistant.server.infrastructure.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "t_dummy")
public class Dummy {

	@Id
	private Long id;

	private Long num;
}
