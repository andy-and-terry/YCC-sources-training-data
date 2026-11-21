-- Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
SET SERVEROUTPUT ON;
DECLARE
  v_out   VARCHAR2(200);
  v_m     PLS_INTEGER;
  v_total PLS_INTEGER;

  FUNCTION gcd(p_a PLS_INTEGER, p_b PLS_INTEGER) RETURN PLS_INTEGER IS
    v_a PLS_INTEGER := p_a;
    v_b PLS_INTEGER := p_b;
    v_t PLS_INTEGER;
  BEGIN
    WHILE v_b <> 0 LOOP
      v_t := MOD(v_a, v_b);
      v_a := v_b;
      v_b := v_t;
    END LOOP;
    RETURN v_a;
  END;

  FUNCTION phi(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
    v_c PLS_INTEGER := 0;
  BEGIN
    FOR k IN 1 .. p_n LOOP
      IF gcd(k, p_n) = 1 THEN
        v_c := v_c + 1;
      END IF;
    END LOOP;
    RETURN v_c;
  END;
BEGIN
  FOR n IN 2 .. 199 LOOP
    v_m := n;
    v_total := 0;
    WHILE v_m > 1 LOOP
      v_m := phi(v_m);
      v_total := v_total + v_m;
    END LOOP;
    IF v_total = n THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
