-- Function: p_fk_customer_p_order()

-- DROP FUNCTION p_fk_customer_p_order();

CREATE OR REPLACE FUNCTION p_fk_customer_p_order()
  RETURNS trigger AS
$BODY$
BEGIN
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      DELETE FROM tc_order WHERE customer_id = OLD.id;
    ELSIF (TG_OP = 'UPDATE' AND NEW.id != OLD.id) THEN
      UPDATE tc_order SET customer_id = NEW.id WHERE customer_id = OLD.id;
    END IF;
    RETURN NEW;
  EXCEPTION WHEN others THEN
    RAISE NOTICE 'Trigger % failed with excetion: % %', TG_NAME, SQLERRM, SQLSTATE;
  END;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION p_fk_customer_p_order()
  OWNER TO fantastik;
