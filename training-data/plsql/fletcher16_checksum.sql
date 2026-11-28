SET SERVEROUTPUT ON;
DECLARE
  v_text VARCHAR2(10) := 'abcde';
  v_s1   PLS_INTEGER := 0;
  v_s2   PLS_INTEGER := 0;
BEGIN
  FOR i IN 1 .. LENGTH(v_text) LOOP
    v_s1 := MOD(v_s1 + ASCII(SUBSTR(v_text, i, 1)), 255);
    v_s2 := MOD(v_s2 + v_s1, 255);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_s2 * 256 + v_s1, 'FMXXXX'));
END;
/
