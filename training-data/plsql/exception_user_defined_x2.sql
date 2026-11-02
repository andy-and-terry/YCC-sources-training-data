DECLARE
  e_low_stock EXCEPTION;
  qty NUMBER := 2;
BEGIN
  IF qty < 5 THEN RAISE e_low_stock; END IF;
EXCEPTION
  WHEN e_low_stock THEN DBMS_OUTPUT.PUT_LINE('restock needed');
  WHEN OTHERS THEN RAISE;
END;
/
