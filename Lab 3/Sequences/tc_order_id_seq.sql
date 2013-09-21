-- Sequence: tc_order_id_seq

-- DROP SEQUENCE tc_order_id_seq;

CREATE SEQUENCE tc_order_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE tc_order_id_seq
  OWNER TO fantastik;
