-- Centered square numbers: n^2 + (n+1)^2.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);
BEGIN
  FOR n IN 0 .. 9 LOOP
    v_out := v_out || (n * n + (n + 1) * (n + 1)) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
