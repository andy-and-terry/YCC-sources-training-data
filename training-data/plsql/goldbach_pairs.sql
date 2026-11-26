-- Goldbach partitions of 100; expect 6.
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
BEGIN
  FOR p IN 2 .. 50 LOOP
    IF is_prime(p) AND is_prime(100 - p) THEN c := c + 1; END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(c);
END;
/
