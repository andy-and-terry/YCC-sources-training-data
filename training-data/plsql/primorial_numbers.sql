-- Primorials up to 1e6, including 1; expect 8.
SET SERVEROUTPUT ON
DECLARE
  c   PLS_INTEGER := 1;
  acc NUMBER := 1;
  p   PLS_INTEGER := 2;
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
  LOOP
    IF is_prime(p) THEN
      acc := acc * p;
      EXIT WHEN acc > 1000000;
      c := c + 1;
    END IF;
    p := p + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(c);
END;
/
