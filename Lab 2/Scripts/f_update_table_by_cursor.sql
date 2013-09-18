-- Function: f_update_table_by_cursor()

-- DROP FUNCTION f_update_table_by_cursor();

CREATE OR REPLACE FUNCTION f_update_table_by_cursor()
  RETURNS void AS
$BODY$
DECLARE
  ts_start timestamp;
  cur CURSOR FOR SELECT * FROM idx FOR UPDATE;
BEGIN
  RAISE NOTICE 'UPDATE idx';
  
  ts_start = clock_timestamp();
  FOR r IN cur LOOP
    UPDATE idx SET ename=f_random_string(50), sal=f_random_salary(10000, 1000), hiredate=f_random_date(1000), job=f_random_string(50) WHERE CURRENT OF cur;
  END LOOP;

  RAISE NOTICE 'Duration: %', clock_timestamp() - ts_start;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_update_table_by_cursor()
  OWNER TO fantastik;
