-- Euler zigzag numbers via the Seidel-Entringer boustrophedon.
SET SERVEROUTPUT ON;
DECLARE
  TYPE t_vec IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  v_row t_vec;
  v_nxt t_vec;
  v_len PLS_INTEGER := 1;
  v_out VARCHAR2(200) := '1 ';
BEGIN
  v_row(1) := 1;
  FOR i IN 1 .. 9 LOOP
    v_nxt(1) := 0;
    FOR j IN 1 .. v_len LOOP
      v_nxt(j + 1) := v_nxt(j) + v_row(v_len - j + 1);
    END LOOP;
    v_len := v_len + 1;
    v_row := v_nxt;
    v_out := v_out || v_row(v_len) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
