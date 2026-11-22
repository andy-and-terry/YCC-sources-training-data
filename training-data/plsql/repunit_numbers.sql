-- Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
SET SERVEROUTPUT ON;
DECLARE
  v_r   NUMBER := 0;
  v_out VARCHAR2(200);
BEGIN
  FOR i IN 1 .. 8 LOOP
    v_r := v_r * 10 + 1;
    v_out := v_out || v_r || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
