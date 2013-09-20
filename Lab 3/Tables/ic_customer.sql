-- Table: ic_customer

-- DROP TABLE ic_customer;

CREATE TABLE ic_customer
(
  id serial NOT NULL,
  fio character varying(50) NOT NULL,
  CONSTRAINT pk_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ic_customer
  OWNER TO fantastik;
