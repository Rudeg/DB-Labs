-- Function: f_generate_row()

-- DROP FUNCTION f_generate_row();

CREATE OR REPLACE FUNCTION f_generate_row()
  RETURNS SETOF record AS
$BODY$
BEGIN
RETURN QUERY SELECT f_random_string(50) as ename, f_random_salary(10000, 1000) as sal, f_random_date(1000) as hiredate, f_random_string(50) as job;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION f_generate_row()
  OWNER TO fantastik;
