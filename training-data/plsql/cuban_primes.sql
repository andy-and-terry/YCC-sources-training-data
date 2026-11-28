SET SERVEROUTPUT ON;
DECLARE
  v_found PLS_INTEGER := 0;
  v_y     PLS_INTEGER := 1;
  v_p     PLS_INTEGER;
  v_out   VARCHAR2(200);
  FUNCTION is_prime(n PLS_INTEGER) RETURN BOOLEAN IS
  BEGIN
    IF n < 2 THEN RETURN FALSE; END IF;
    FOR i IN 2 .. TRUNC(SQRT(n)) LOOP
      IF MOD(n, i) = 0 THEN RETURN FALSE; END IF;
    END LOOP;
    RETURN TRUE;
  END;
BEGIN
  WHILE v_found < 8 LOOP
    v_p := 3 * v_y * v_y + 3 * v_y + 1;
    IF is_prime(v_p) THEN
      v_out := v_out || v_p || ' ';
      v_found := v_found + 1;
    END IF;
    v_y := v_y + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
