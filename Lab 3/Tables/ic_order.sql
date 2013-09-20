-- Table: ic_order

-- DROP TABLE ic_order;

CREATE TABLE ic_order
(
  id serial NOT NULL,
  product character varying(50) NOT NULL,
  amount numeric(6,0) NOT NULL,
  price money NOT NULL,
  customer_id integer,
  CONSTRAINT pk_ic_order PRIMARY KEY (id),
  CONSTRAINT fk_ic_order_reference_ic_customer FOREIGN KEY (customer_id)
      REFERENCES ic_customer (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ic_order
  OWNER TO fantastik;
