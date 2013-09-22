-- Table: idx

-- DROP TABLE idx;

CREATE TABLE idx
(
  sal money NOT NULL,
  hiredate date NOT NULL,
  ename text NOT NULL,
  job text NOT NULL,
  CONSTRAINT idx_pkey PRIMARY KEY (ename)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE idx
  OWNER TO fantastik;

-- Index: idx_ename

-- DROP INDEX idx_ename;

CREATE INDEX idx_ename
  ON idx
  USING btree
  (ename COLLATE pg_catalog."default");

-- Index: idx_sal

-- DROP INDEX idx_sal;

CREATE INDEX idx_sal
  ON idx
  USING btree
  (sal);

