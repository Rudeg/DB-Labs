-- Table: tc_order

-- DROP TABLE tc_order;

CREATE TABLE tc_order
(
  id serial NOT NULL,
  product character varying(50) NOT NULL,
  amount numeric(6,0) NOT NULL,
  price money NOT NULL,
  customer_id integer,
  CONSTRAINT pk_tc_order PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_order
  OWNER TO fantastik;
