-- Function: f_sum_by_cursor()

-- DROP FUNCTION f_sum_by_cursor();

CREATE OR REPLACE FUNCTION f_sum_by_cursor()
  RETURNS void AS
$BODY$
DECLARE
  sum money := 0;
  cur CURSOR FOR SELECT sal FROM idx;
BEGIN
  FOR rec IN cur LOOP
    sum := sum + rec.sal;
  END LOOP;
  RETURN;
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_sum_by_cursor()
  OWNER TO fantastik;
