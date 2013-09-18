-- Function: f_random_salary(integer, integer)

-- DROP FUNCTION f_random_salary(integer, integer);

CREATE OR REPLACE FUNCTION f_random_salary(max integer, min integer DEFAULT 0)
  RETURNS money AS
$BODY$BEGIN
  RETURN f_random_int(max, min) + f_random_int(100) / 100.0;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_random_salary(integer, integer)
  OWNER TO fantastik;
