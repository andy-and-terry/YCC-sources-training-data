-- Moebius function: 0 if n has a squared prime factor, else (-1)^k.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);

  FUNCTION mobius(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
    v_n      PLS_INTEGER := p_n;
    v_result PLS_INTEGER := 1;
    v_p      PLS_INTEGER := 2;
  BEGIN
    WHILE v_p * v_p <= v_n LOOP
      IF MOD(v_n, v_p) = 0 THEN
        v_n := v_n / v_p;
        IF MOD(v_n, v_p) = 0 THEN
          RETURN 0;
        END IF;
        v_result := -v_result;
      END IF;
      v_p := v_p + 1;
    END LOOP;
    IF v_n > 1 THEN
      v_result := -v_result;
    END IF;
    RETURN v_result;
  END;
BEGIN
  FOR n IN 1 .. 30 LOOP
    v_out := v_out || mobius(n) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
