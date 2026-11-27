SET SERVEROUTPUT ON;
DECLARE
  TYPE t_row IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  TYPE t_grid IS TABLE OF t_row INDEX BY PLS_INTEGER;
  d     t_grid;
  v_out VARCHAR2(200);
BEGIN
  FOR i IN 0 .. 7 LOOP
    FOR j IN 0 .. 7 LOOP
      IF i = 0 OR j = 0 THEN
        d(i)(j) := 1;
      ELSE
        d(i)(j) := d(i - 1)(j) + d(i)(j - 1) + d(i - 1)(j - 1);
      END IF;
    END LOOP;
    v_out := v_out || d(i)(i) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
