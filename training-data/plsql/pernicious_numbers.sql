-- Pernicious numbers: the popcount is prime.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);

  FUNCTION popcount(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
    v_m PLS_INTEGER := p_n;
    v_c PLS_INTEGER := 0;
  BEGIN
    WHILE v_m > 0 LOOP
      v_c := v_c + MOD(v_m, 2);
      v_m := TRUNC(v_m / 2);
    END LOOP;
    RETURN v_c;
  END;

  FUNCTION is_prime(p_n PLS_INTEGER) RETURN BOOLEAN IS
  BEGIN
    IF p_n < 2 THEN
      RETURN FALSE;
    END IF;
    FOR d IN 2 .. p_n - 1 LOOP
      EXIT WHEN d * d > p_n;
      IF MOD(p_n, d) = 0 THEN
        RETURN FALSE;
      END IF;
    END LOOP;
    RETURN TRUE;
  END;
BEGIN
  FOR n IN 1 .. 20 LOOP
    IF is_prime(popcount(n)) THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
