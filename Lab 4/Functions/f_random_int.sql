-- Function: f_random_int(integer, integer)

-- DROP FUNCTION f_random_int(integer, integer);

CREATE OR REPLACE FUNCTION f_random_int(max integer, min integer DEFAULT 0)
  RETURNS integer AS
$BODY$BEGIN
  RETURN round(random() * (max - min) + min);
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_random_int(integer, integer)
  OWNER TO fantastik;
