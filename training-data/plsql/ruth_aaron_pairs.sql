-- Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);

  FUNCTION sopfr(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
    v_m     PLS_INTEGER := p_n;
    v_p     PLS_INTEGER := 2;
    v_total PLS_INTEGER := 0;
  BEGIN
    WHILE v_p * v_p <= v_m LOOP
      WHILE MOD(v_m, v_p) = 0 LOOP
        v_total := v_total + v_p;
        v_m := v_m / v_p;
      END LOOP;
      v_p := v_p + 1;
    END LOOP;
    IF v_m > 1 THEN
      v_total := v_total + v_m;
    END IF;
    RETURN v_total;
  END;
BEGIN
  FOR n IN 2 .. 109 LOOP
    IF sopfr(n) = sopfr(n + 1) THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
