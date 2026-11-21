-- Disarium numbers: digits raised to their 1-based positions sum to n.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);

  FUNCTION is_disarium(p_n PLS_INTEGER) RETURN BOOLEAN IS
    v_str VARCHAR2(10) := TO_CHAR(p_n);
    v_sum PLS_INTEGER := 0;
  BEGIN
    FOR i IN 1 .. LENGTH(v_str) LOOP
      v_sum := v_sum + POWER(TO_NUMBER(SUBSTR(v_str, i, 1)), i);
    END LOOP;
    RETURN v_sum = p_n;
  END;
BEGIN
  FOR n IN 1 .. 999 LOOP
    IF is_disarium(n) THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
