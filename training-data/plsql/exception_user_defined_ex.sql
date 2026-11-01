DECLARE
  e_too_small EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_too_small, -20001);
  v NUMBER := 3;
BEGIN
  IF v < 5 THEN
    RAISE_APPLICATION_ERROR(-20001, 'value too small: ' || v);
  END IF;
EXCEPTION
  WHEN e_too_small THEN
    DBMS_OUTPUT.PUT_LINE('caught: ' || SQLERRM);
  WHEN OTHERS THEN
    RAISE;
END;
/
