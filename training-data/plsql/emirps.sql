-- Emirps below 200; expect 15.
SET SERVEROUTPUT ON
DECLARE
  c PLS_INTEGER := 0;
  r PLS_INTEGER;
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
  FOR n IN 2 .. 199 LOOP
    r := TO_NUMBER(REVERSE(TO_CHAR(n)));
    IF r <> n AND is_prime(n) AND is_prime(r) THEN c := c + 1; END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(c);
END;
/
