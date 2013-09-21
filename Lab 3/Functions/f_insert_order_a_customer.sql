-- Function: f_insert_order_a_customer(regclass, regclass, character varying, character varying, numeric, money)

-- DROP FUNCTION f_insert_order_a_customer(regclass, regclass, character varying, character varying, numeric, money);

CREATE OR REPLACE FUNCTION f_insert_order_a_customer(customer regclass, ord regclass, fio character varying, product character varying, amount numeric, price money)
  RETURNS void AS
$BODY$
DECLARE
  ident integer;
BEGIN
  SELECT nextval(pg_get_serial_sequence(customer::text, 'id')) INTO ident;
  BEGIN
    EXECUTE 'INSERT INTO ' || customer || '(id, fio) VALUES ($1, $2)' USING ident, fio;
    EXECUTE 'INSERT INTO ' || ord || '(product, amount, price, customer_id) VALUES ($1,$2,$3,$4)' USING product, amount, price, ident;
  EXCEPTION WHEN others THEN
    RAISE NOTICE 'Function % failed with excetion: % %', TG_NAME, SQLERRM, SQLSTATE;
  END;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_insert_order_a_customer(regclass, regclass, character varying, character varying, numeric, money)
  OWNER TO fantastik;
