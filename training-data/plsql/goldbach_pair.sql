-- Goldbach pair using a local function.
DECLARE
  FUNCTION is_prime(n PLS_INTEGER) RETURN BOOLEAN IS
  BEGIN
    IF n < 2 THEN RETURN FALSE; END IF;
    FOR d IN 2 .. TRUNC(SQRT(n)) LOOP
      IF MOD(n, d) = 0 THEN RETURN FALSE; END IF;
    END LOOP;
    RETURN TRUE;
  END;
BEGIN
  FOR p IN 2 .. 14 LOOP
    IF is_prime(p) AND is_prime(28 - p) THEN
      DBMS_OUTPUT.PUT_LINE(p || ' + ' || (28 - p));
      EXIT;
    END IF;
  END LOOP;
END;
/
