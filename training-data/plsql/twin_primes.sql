-- Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);

  FUNCTION is_prime(p_n PLS_INTEGER) RETURN BOOLEAN IS
    d PLS_INTEGER := 2;
  BEGIN
    IF p_n < 2 THEN RETURN FALSE; END IF;
    WHILE d * d <= p_n LOOP
      IF MOD(p_n, d) = 0 THEN RETURN FALSE; END IF;
      d := d + 1;
    END LOOP;
    RETURN TRUE;
  END;
BEGIN
  FOR p IN 2 .. 99 LOOP
    IF is_prime(p) AND is_prime(p + 2) THEN
      v_out := v_out || p || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
