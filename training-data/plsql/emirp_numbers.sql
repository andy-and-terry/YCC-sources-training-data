-- Emirps: primes whose digit reversal is a different prime.
SET SERVEROUTPUT ON;
DECLARE
  FUNCTION is_prime(n PLS_INTEGER) RETURN BOOLEAN IS
    i PLS_INTEGER := 2;
  BEGIN
    IF n < 2 THEN
      RETURN FALSE;
    END IF;
    WHILE i * i <= n LOOP
      IF MOD(n, i) = 0 THEN
        RETURN FALSE;
      END IF;
      i := i + 1;
    END LOOP;
    RETURN TRUE;
  END is_prime;

  FUNCTION reverse_digits(n PLS_INTEGER) RETURN PLS_INTEGER IS
  BEGIN
    RETURN TO_NUMBER(REVERSE(TO_CHAR(n)));
  END reverse_digits;
  r PLS_INTEGER;
BEGIN
  FOR n IN 2 .. 99 LOOP
    r := reverse_digits(n);
    IF r <> n AND is_prime(n) AND is_prime(r) THEN
      DBMS_OUTPUT.PUT(n || ' ');
    END IF;
  END LOOP;
  DBMS_OUTPUT.NEW_LINE;
END;
/
