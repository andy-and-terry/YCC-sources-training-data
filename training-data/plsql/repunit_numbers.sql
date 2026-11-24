-- Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
SET SERVEROUTPUT ON;
DECLARE
  v_r NUMBER := 0;
BEGIN
  FOR n IN 1 .. 8 LOOP
    v_r := v_r * 10 + 1;
    DBMS_OUTPUT.PUT_LINE(v_r || CASE WHEN MOD(v_r, 3) = 0 THEN '  (divisible by 3)' END);
  END LOOP;
END;
/
