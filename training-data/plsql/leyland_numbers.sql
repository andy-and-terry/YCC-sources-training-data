-- Leyland numbers: x^y + y^x for x >= y >= 2.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);
BEGIN
  FOR x IN 2 .. 4 LOOP
    FOR y IN 2 .. x LOOP
      v_out := v_out || (POWER(x, y) + POWER(y, x)) || ' ';
    END LOOP;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
