DECLARE
  e_low_balance EXCEPTION;
  v_balance NUMBER := 10;
BEGIN
  IF v_balance < 50 THEN
    RAISE e_low_balance;
  END IF;
EXCEPTION
  WHEN e_low_balance THEN
    DBMS_OUTPUT.PUT_LINE('balance too low');
END;
/
