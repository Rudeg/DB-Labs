-- Function: f_random_string(integer)

-- DROP FUNCTION f_random_string(integer);

CREATE OR REPLACE FUNCTION f_random_string(len integer DEFAULT 50)
  RETURNS character varying AS
$BODY$
DECLARE
  validchars varchar := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-=+&$';
  random_str varchar;
  valid_ch_len integer := char_length(validchars);
BEGIN
  FOR i IN 1..len LOOP
    random_str := concat(random_str, substring(validchars, f_random_int(valid_ch_len), 1));
  END LOOP;
  RETURN random_str;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_random_string(integer)
  OWNER TO fantastik;
