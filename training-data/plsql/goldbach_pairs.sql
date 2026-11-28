-- Goldbach decompositions of 28
SET SERVEROUTPUT ON;
DECLARE
  n CONSTANT PLS_INTEGER := 28;
  FUNCTION is_prime(p_n PLS_INTEGER) RETURN BOOLEAN IS
  BEGIN
    IF p_n < 2 THEN RETURN FALSE; END IF;
    FOR d IN 2 .. TRUNC(SQRT(p_n)) LOOP
      IF MOD(p_n, d) = 0 THEN RETURN FALSE; END IF;
    END LOOP;
    RETURN TRUE;
  END;
BEGIN
  FOR p IN 2 .. n / 2 LOOP
    IF is_prime(p) AND is_prime(n - p) THEN
      DBMS_OUTPUT.PUT_LINE(p || ' + ' || (n - p));
    END IF;
  END LOOP;
END;
/
