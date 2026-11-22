-- Sophie Germain primes: p prime and 2p + 1 prime.
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
    IF is_prime(p) AND is_prime(2 * p + 1) THEN
      v_out := v_out || p || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
