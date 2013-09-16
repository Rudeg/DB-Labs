-- Function: f_select_from(regclass, text[])

-- DROP FUNCTION f_select_from(regclass, text[]);

CREATE OR REPLACE FUNCTION f_select_from(tbl regclass, order_args text[])
  RETURNS void AS
$BODY$
DECLARE
  tmp text;
  cmd text;
  ts_start timestamp;
BEGIN
  cmd := 'SELECT ename FROM ' || tbl || ' ORDER by ' || array_to_string(order_args, ',') || ';';
  RAISE NOTICE '%', cmd;

  ts_start := clock_timestamp();
  EXECUTE cmd INTO tmp;

  RAISE NOTICE 'Duration %', clock_timestamp() - ts_start;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_select_from(regclass, text[])
  OWNER TO fantastik;
