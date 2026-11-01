-- Reverse-and-add until a palindrome; count the steps.
SET SERVEROUTPUT ON;
DECLARE
  TYPE t_nums IS TABLE OF PLS_INTEGER;
  v_starts t_nums := t_nums(56, 57, 59, 79, 89);
  v_out    VARCHAR2(200);

  FUNCTION reverse_num(p_n NUMBER) RETURN NUMBER IS
    v_r VARCHAR2(40) := '';
    v_s VARCHAR2(40) := TO_CHAR(p_n);
  BEGIN
    FOR i IN REVERSE 1 .. LENGTH(v_s) LOOP
      v_r := v_r || SUBSTR(v_s, i, 1);
    END LOOP;
    RETURN TO_NUMBER(v_r);
  END;

  FUNCTION steps(p_start NUMBER) RETURN PLS_INTEGER IS
    v_n NUMBER := p_start;
  BEGIN
    FOR c IN 0 .. 49 LOOP
      IF c > 0 AND v_n = reverse_num(v_n) THEN
        RETURN c;
      END IF;
      v_n := v_n + reverse_num(v_n);
    END LOOP;
    RETURN -1;
  END;
BEGIN
  FOR i IN 1 .. v_starts.COUNT LOOP
    v_out := v_out || steps(v_starts(i)) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
