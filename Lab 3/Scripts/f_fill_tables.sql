-- Function: f_fill_tables(regclass, regclass, integer)

-- DROP FUNCTION f_fill_tables(regclass, regclass, integer);

CREATE OR REPLACE FUNCTION f_fill_tables(customer regclass, ord regclass, count integer)
  RETURNS void AS
$BODY$
BEGIN
  FOR i IN 0..count LOOP
    perform f_insert_order_a_customer(customer, ord, f_random_string(50)::varchar(50), f_random_string(50)::varchar(50), f_random_int(1000)::numeric(6), f_random_salary(100000));
  END LOOP;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_fill_tables(regclass, regclass, integer)
  OWNER TO fantastik;
