-- Rail fence encryption with 3 rails
SET SERVEROUTPUT ON;
DECLARE
  text   VARCHAR2(30) := 'WEAREDISCOVERED';
  k      CONSTANT PLS_INTEGER := 3;
  cycle  CONSTANT PLS_INTEGER := 4;
  out_s  VARCHAR2(30);
  r      PLS_INTEGER;
BEGIN
  FOR rail_no IN 0 .. k - 1 LOOP
    FOR i IN 0 .. LENGTH(text) - 1 LOOP
      r := MOD(i, cycle);
      IF r >= k THEN r := cycle - r; END IF;
      IF r = rail_no THEN out_s := out_s || SUBSTR(text, i + 1, 1); END IF;
    END LOOP;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(out_s);
END;
/
