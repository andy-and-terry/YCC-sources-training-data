-- Aliquot sequence: replace n by the sum of its proper divisors.
SET SERVEROUTPUT ON;
DECLARE
  v_n     PLS_INTEGER := 12;
  v_count PLS_INTEGER := 0;
  v_out   VARCHAR2(200);

  FUNCTION aliquot_sum(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
    v_s PLS_INTEGER := 0;
  BEGIN
    FOR d IN 1 .. TRUNC(p_n / 2) LOOP
      IF MOD(p_n, d) = 0 THEN
        v_s := v_s + d;
      END IF;
    END LOOP;
    RETURN v_s;
  END;
BEGIN
  v_out := v_n || ' ';
  WHILE v_n > 1 AND v_count < 19 LOOP
    v_n := aliquot_sum(v_n);
    v_out := v_out || v_n || ' ';
    v_count := v_count + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
