-- Amicable pairs below 1500 via sums of proper divisors.
SET SERVEROUTPUT ON;
DECLARE
  v_b PLS_INTEGER;

  FUNCTION s(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
    v_t PLS_INTEGER := 0;
  BEGIN
    FOR d IN 1 .. p_n - 1 LOOP
      IF MOD(p_n, d) = 0 THEN
        v_t := v_t + d;
      END IF;
    END LOOP;
    RETURN v_t;
  END;
BEGIN
  FOR a IN 2 .. 1499 LOOP
    v_b := s(a);
    IF v_b > a AND s(v_b) = a THEN
      DBMS_OUTPUT.PUT_LINE(a || ' ' || v_b);
    END IF;
  END LOOP;
END;
/
