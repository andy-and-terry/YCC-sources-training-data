DECLARE
  e_too_low EXCEPTION;
  v_bal NUMBER := 5;
BEGIN
  IF v_bal < 10 THEN RAISE e_too_low; END IF;
EXCEPTION
  WHEN e_too_low THEN DBMS_OUTPUT.PUT_LINE('balance too low');
  WHEN OTHERS THEN RAISE;
END;
/
