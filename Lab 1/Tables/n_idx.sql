-- Table: n_idx

-- DROP TABLE n_idx;

CREATE TABLE n_idx
(
  sal money NOT NULL,
  hiredate date NOT NULL,
  ename text NOT NULL,
  job text NOT NULL,
  CONSTRAINT n_idx_pkey PRIMARY KEY (ename)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE n_idx
  OWNER TO fantastik;
