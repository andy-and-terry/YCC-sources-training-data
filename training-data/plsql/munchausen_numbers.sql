-- Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);

  FUNCTION is_munchausen(p_n PLS_INTEGER) RETURN BOOLEAN IS
    v_m   PLS_INTEGER := p_n;
    v_d   PLS_INTEGER;
    v_sum PLS_INTEGER := 0;
  BEGIN
    WHILE v_m > 0 LOOP
      v_d := MOD(v_m, 10);
      IF v_d > 0 THEN
        v_sum := v_sum + POWER(v_d, v_d);
      END IF;
      v_m := TRUNC(v_m / 10);
    END LOOP;
    RETURN v_sum = p_n;
  END;
BEGIN
  FOR n IN 1 .. 4999 LOOP
    IF is_munchausen(n) THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
