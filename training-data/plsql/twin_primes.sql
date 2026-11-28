-- Twin primes below 50
SET SERVEROUTPUT ON;
DECLARE
  FUNCTION is_prime(p_n PLS_INTEGER) RETURN BOOLEAN IS
  BEGIN
    IF p_n < 2 THEN RETURN FALSE; END IF;
    FOR d IN 2 .. TRUNC(SQRT(p_n)) LOOP
      IF MOD(p_n, d) = 0 THEN RETURN FALSE; END IF;
    END LOOP;
    RETURN TRUE;
  END;
BEGIN
  FOR p IN 3 .. 48 LOOP
    IF is_prime(p) AND is_prime(p + 2) THEN
      DBMS_OUTPUT.PUT_LINE('(' || p || ', ' || (p + 2) || ')');
    END IF;
  END LOOP;
END;
/
