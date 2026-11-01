-- Ways to write n as a sum of two or more consecutive positive integers.
SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(200);

  FUNCTION polite_ways(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
    v_k    PLS_INTEGER := 2;
    v_ways PLS_INTEGER := 0;
  BEGIN
    WHILE v_k * (v_k + 1) / 2 <= p_n LOOP
      IF MOD(p_n - v_k * (v_k - 1) / 2, v_k) = 0 THEN
        v_ways := v_ways + 1;
      END IF;
      v_k := v_k + 1;
    END LOOP;
    RETURN v_ways;
  END;
BEGIN
  FOR n IN 1 .. 16 LOOP
    v_out := v_out || polite_ways(n) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
