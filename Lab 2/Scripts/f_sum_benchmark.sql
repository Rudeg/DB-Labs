-- Function: f_sum_benchmark()

-- DROP FUNCTION f_sum_benchmark();

CREATE OR REPLACE FUNCTION f_sum_benchmark()
  RETURNS void AS
$BODY$
DECLARE
  ts_start timestamp;
BEGIN
  ts_start := clock_timestamp();
  PERFORM SUM(sal) FROM idx;
  RAISE NOTICE 'PERFORM SUM(sal) FROM idx;';
  RAISE NOTICE 'Duration: %', clock_timestamp() - ts_start;

  ts_start := clock_timestamp();
  PERFORM f_sum_by_cursor();
  RAISE NOTICE 'SELECT f_sum_by_cursor();';
  RAISE NOTICE 'Duration: %', clock_timestamp() - ts_start; 
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_sum_benchmark()
  OWNER TO fantastik;
