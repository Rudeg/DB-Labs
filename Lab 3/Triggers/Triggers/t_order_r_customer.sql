-- Trigger: t_order_r_customer on tc_order

-- DROP TRIGGER t_order_r_customer ON tc_order;

CREATE TRIGGER t_order_r_customer
  BEFORE INSERT OR UPDATE
  ON tc_order
  FOR EACH ROW
  EXECUTE PROCEDURE p_fk_order_r_customer();
