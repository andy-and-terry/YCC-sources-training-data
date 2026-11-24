-- Fibbinary numbers: no two adjacent 1 bits.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);
BEGIN
  FOR n IN 0 .. 49 LOOP
    IF BITAND(n, TRUNC(n / 2)) = 0 THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
