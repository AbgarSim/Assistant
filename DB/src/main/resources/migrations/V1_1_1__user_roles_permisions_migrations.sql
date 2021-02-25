

CREATE TABLE t_permission (
	id varchar NOT NULL,
	title varchar NOT NULL,
	slug varchar NOT NULL,
	description varchar NULL,
	active bool NOT NULL DEFAULT true,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	CONSTRAINT t_permission_pk PRIMARY KEY (id)
);

CREATE TABLE t_role (
	id varchar NOT NULL,
	title varchar NOT NULL,
	slug varchar NULL,
	description varchar NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	CONSTRAINT t_role_pk PRIMARY KEY (id)
);

CREATE TABLE t_role_permission (
	role_id varchar NOT NULL,
	permission_id varchar NOT NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	CONSTRAINT t_rp_r_fk FOREIGN KEY (role_id) REFERENCES t_role(id),
	CONSTRAINT t_rp_p_fk FOREIGN KEY (permission_id) REFERENCES t_permission(id)
);


CREATE TABLE t_user (
	id varchar NOT NULL,
	first_name varchar NULL,
	last_name varchar NULL,
	email varchar NULL,
	password_hash varchar NULL,
	created_at date NOT NULL,
	CONSTRAINT t_user_pk PRIMARY KEY (id)
);

CREATE TABLE t_user_role (
	user_id varchar NULL,
	role_id varchar NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	CONSTRAINT t_ur_r_fk FOREIGN KEY (role_id) REFERENCES t_role(id),
	CONSTRAINT t_ur_u_fk FOREIGN KEY (user_id) REFERENCES t_user(id)
);


