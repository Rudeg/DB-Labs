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

-- Index: idx_ename_idx

-- DROP INDEX idx_ename_idx;

CREATE INDEX idx_ename_idx
  ON idx
  USING btree
  (ename COLLATE pg_catalog."default");

-- Index: idx_sal

-- DROP INDEX idx_sal;

CREATE INDEX idx_sal
  ON idx
  USING btree
  (sal);

