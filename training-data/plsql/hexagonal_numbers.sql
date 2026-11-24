-- Hexagonal numbers: n(2n-1).
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);
BEGIN
  FOR n IN 1 .. 10 LOOP
    v_out := v_out || (n * (2 * n - 1)) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
