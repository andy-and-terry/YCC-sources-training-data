-- Circular primes below 100; expect 13.
SET SERVEROUTPUT ON
DECLARE
  c PLS_INTEGER := 0;
  FUNCTION is_prime(n IN PLS_INTEGER) RETURN BOOLEAN IS
    d PLS_INTEGER := 2;
  BEGIN
    IF n < 2 THEN RETURN FALSE; END IF;
    WHILE d * d <= n LOOP
      IF MOD(n, d) = 0 THEN RETURN FALSE; END IF;
      d := d + 1;
    END LOOP;
    RETURN TRUE;
  END is_prime;
  FUNCTION circular(n IN PLS_INTEGER) RETURN BOOLEAN IS
    s VARCHAR2(10) := TO_CHAR(n);
  BEGIN
    FOR i IN 0 .. LENGTH(s) - 1 LOOP
      IF NOT is_prime(TO_NUMBER(SUBSTR(s, i + 1) || SUBSTR(s, 1, i))) THEN RETURN FALSE; END IF;
    END LOOP;
    RETURN TRUE;
  END circular;
BEGIN
  FOR n IN 2 .. 99 LOOP
    IF circular(n) THEN c := c + 1; END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(c);
END;
/
