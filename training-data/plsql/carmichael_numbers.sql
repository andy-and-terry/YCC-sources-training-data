-- Carmichael numbers via Korselt's criterion: n is squarefree, composite,
-- and p - 1 divides n - 1 for every prime factor p.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);

  FUNCTION is_carmichael(p_n PLS_INTEGER) RETURN BOOLEAN IS
    v_m     PLS_INTEGER := p_n;
    v_p     PLS_INTEGER := 2;
    v_count PLS_INTEGER := 0;
  BEGIN
    WHILE v_p * v_p <= v_m LOOP
      IF MOD(v_m, v_p) = 0 THEN
        v_m := v_m / v_p;
        IF MOD(v_m, v_p) = 0 THEN
          RETURN FALSE;
        END IF;
        IF MOD(p_n - 1, v_p - 1) <> 0 THEN
          RETURN FALSE;
        END IF;
        v_count := v_count + 1;
      END IF;
      v_p := v_p + 1;
    END LOOP;
    IF v_m > 1 THEN
      IF MOD(p_n - 1, v_m - 1) <> 0 THEN
        RETURN FALSE;
      END IF;
      v_count := v_count + 1;
    END IF;
    RETURN v_count >= 2;
  END;
BEGIN
  FOR n IN 3 .. 2999 LOOP
    IF MOD(n, 2) = 1 AND is_carmichael(n) THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
