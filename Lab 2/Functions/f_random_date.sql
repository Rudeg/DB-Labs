-- Function: f_random_date(integer)

-- DROP FUNCTION f_random_date(integer);

CREATE OR REPLACE FUNCTION f_random_date(randomized_days integer DEFAULT 365)
  RETURNS date AS
$BODY$BEGIN
  RETURN current_date - f_random_int(randomized_days);
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_random_date(integer)
  OWNER TO fantastik;
