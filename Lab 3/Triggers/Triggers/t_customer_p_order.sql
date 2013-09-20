-- Trigger: t_customer_p_order on tc_customer

-- DROP TRIGGER t_customer_p_order ON tc_customer;

CREATE TRIGGER t_customer_p_order
  AFTER UPDATE OR DELETE
  ON tc_customer
  FOR EACH ROW
  EXECUTE PROCEDURE p_fk_customer_p_order();
