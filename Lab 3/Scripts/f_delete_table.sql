-- Function: f_delete_table(regclass)

-- DROP FUNCTION f_delete_table(regclass);

CREATE OR REPLACE FUNCTION f_delete_table(tbl regclass)
  RETURNS void AS
$BODY$
DECLARE
  ts_start timestamp;
  cmd text;
BEGIN
  cmd := format('DELETE FROM %I;', tbl);
  RAISE NOTICE '%', cmd;
  ts_start := clock_timestamp();

  EXECUTE cmd;

  RAISE NOTICE 'Duration: %', clock_timestamp() - ts_start;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_delete_table(regclass)
  OWNER TO fantastik;
