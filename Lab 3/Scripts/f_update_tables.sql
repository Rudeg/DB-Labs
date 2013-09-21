-- Function: f_update_tables(regclass, regclass)

-- DROP FUNCTION f_update_tables(regclass, regclass);

CREATE OR REPLACE FUNCTION f_update_tables(customer regclass, ord regclass)
  RETURNS void AS
$BODY$
DECLARE
  cmd text;
  ts_start timestamp;
  rec record;
BEGIN
  cmd := format('SELECT * FROM %I', customer);
  RAISE NOTICE 'Customer: % FOR UPDATE', cmd;
  ts_start := clock_timestamp();
  
  FOR rec IN EXECUTE cmd FOR UPDATE LOOP
    EXECUTE format('UPDATE %I SET fio = $1 WHERE ctid = $2', customer) USING f_random_string(50)::varchar(50), rec.ctid;
  END LOOP; 
  RAISE NOTICE 'Duration: %', clock_timestamp() - ts_start;

  cmd := format('SELECT * FROM %I FOR UPDATE', ord);
  RAISE NOTICE 'Order: %', cmd;
  ts_start := clock_timestamp();

  FOR rec IN EXECUTE cmd FOR UPDATE LOOP
    EXECUTE format('UPDATE %I SET product=$1, amount=$2, price=$3 WHERE ctid = $4', ord) 
      USING f_random_string(50)::varchar(50), f_random_int(10000)::numeric(6), f_random_salary(100000), rec.ctid;
  END LOOP;
  RAISE NOTICE 'Duration: %', clock_timestamp() - ts_start;
  
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_update_tables(regclass, regclass)
  OWNER TO fantastik;
