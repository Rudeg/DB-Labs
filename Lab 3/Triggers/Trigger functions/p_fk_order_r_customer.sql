-- Function: p_fk_order_r_customer()

-- DROP FUNCTION p_fk_order_r_customer();

CREATE OR REPLACE FUNCTION p_fk_order_r_customer()
  RETURNS trigger AS
$BODY$
BEGIN
  BEGIN
    IF (TG_OP = 'UPDATE' AND NEW.customer_id = OLD.customer_id) THEN
      RETURN NEW;
    END IF;
    
    IF NOT EXISTS(SELECT id FROM tc_customer WHERE id = NEW.customer_id) THEN
      RAISE EXCEPTION 'Foreign key % not found in %', TG_NAME, TG_TABLE_NAME; 
      RETURN NULL;
    END IF;
    
    RETURN NEW;
    
  EXCEPTION WHEN others THEN
    RAISE NOTICE 'Trigger t_order_r_customer failed with excetion: % %', SQLERRM, SQLSTATE;
  END;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION p_fk_order_r_customer()
  OWNER TO fantastik;
