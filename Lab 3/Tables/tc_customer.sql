-- Table: tc_customer

-- DROP TABLE tc_customer;

CREATE TABLE tc_customer
(
  id serial NOT NULL,
  fio character varying(150) NOT NULL,
  CONSTRAINT pk_tc_customer PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_customer
  OWNER TO fantastik;
