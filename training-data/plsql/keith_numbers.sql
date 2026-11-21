-- Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
SET SERVEROUTPUT ON;
DECLARE
  TYPE t_seq IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
  v_out VARCHAR2(200);

  FUNCTION is_keith(p_n PLS_INTEGER) RETURN BOOLEAN IS
    v_seq t_seq;
    v_str VARCHAR2(10) := TO_CHAR(p_n);
    v_k   PLS_INTEGER := LENGTH(v_str);
    v_len PLS_INTEGER := v_k;
    v_sum PLS_INTEGER;
  BEGIN
    FOR i IN 1 .. v_k LOOP
      v_seq(i) := TO_NUMBER(SUBSTR(v_str, i, 1));
    END LOOP;
    WHILE v_seq(v_len) < p_n LOOP
      v_sum := 0;
      FOR i IN v_len - v_k + 1 .. v_len LOOP
        v_sum := v_sum + v_seq(i);
      END LOOP;
      v_len := v_len + 1;
      v_seq(v_len) := v_sum;
    END LOOP;
    RETURN v_seq(v_len) = p_n;
  END;
BEGIN
  FOR n IN 10 .. 1199 LOOP
    IF is_keith(n) THEN
      v_out := v_out || n || ' ';
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
