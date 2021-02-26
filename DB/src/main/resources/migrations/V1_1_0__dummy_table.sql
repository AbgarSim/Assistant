CREATE TABLE t_dummy
(

    id  varchar NOT NULL,
    num int default 1,
    CONSTRAINT t_dummy_pk PRIMARY KEY (id)
);

INSERT INTO t_dummy (id, num) VALUES (1,1);
