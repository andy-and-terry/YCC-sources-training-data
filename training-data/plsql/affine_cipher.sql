-- Affine cipher y = (5x + 8) mod 26
SET SERVEROUTPUT ON;
DECLARE
  msg   VARCHAR2(20) := 'AFFINE';
  out_s VARCHAR2(20);
  x     PLS_INTEGER;
BEGIN
  FOR i IN 1 .. LENGTH(msg) LOOP
    x := ASCII(SUBSTR(msg, i, 1)) - 65;
    out_s := out_s || CHR(MOD(5 * x + 8, 26) + 65);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(out_s);
END;
/
