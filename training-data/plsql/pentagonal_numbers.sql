-- Pentagonal numbers: n(3n-1)/2.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);
BEGIN
  FOR n IN 1 .. 10 LOOP
    v_out := v_out || (n * (3 * n - 1) / 2) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
