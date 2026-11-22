-- Emirps: primes whose digit reversal is a different prime.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(400);
  v_r   PLS_INTEGER;

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

  FUNCTION reverse_num(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
  BEGIN
    RETURN TO_NUMBER(REVERSE(TO_CHAR(p_n)));
  END;
BEGIN
  FOR n IN 2 .. 199 LOOP
    v_r := reverse_num(n);
    IF v_r <> n AND is_prime(n) AND is_prime(v_r) THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
