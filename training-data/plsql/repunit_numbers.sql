-- Repunits: numbers made only of the digit 1.
SET SERVEROUTPUT ON;
DECLARE
  r NUMBER := 0;
BEGIN
  FOR i IN 1 .. 5 LOOP
    r := r * 10 + 1;
    DBMS_OUTPUT.PUT_LINE(r);
  END LOOP;
END;
/
