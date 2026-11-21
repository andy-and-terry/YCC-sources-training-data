-- Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
SET SERVEROUTPUT ON;
DECLARE
  v_count PLS_INTEGER := 0;

  FUNCTION is_bouncy(p_n PLS_INTEGER) RETURN BOOLEAN IS
    v_str VARCHAR2(10) := TO_CHAR(p_n);
    v_inc BOOLEAN := TRUE;
    v_dec BOOLEAN := TRUE;
  BEGIN
    FOR i IN 2 .. LENGTH(v_str) LOOP
      IF SUBSTR(v_str, i - 1, 1) > SUBSTR(v_str, i, 1) THEN
        v_inc := FALSE;
      END IF;
      IF SUBSTR(v_str, i - 1, 1) < SUBSTR(v_str, i, 1) THEN
        v_dec := FALSE;
      END IF;
    END LOOP;
    RETURN NOT v_inc AND NOT v_dec;
  END;
BEGIN
  FOR n IN 1 .. 999 LOOP
    IF is_bouncy(n) THEN
      v_count := v_count + 1;
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_count);
END;
/
