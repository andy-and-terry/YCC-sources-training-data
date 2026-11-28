-- Manhattan distance between (1,2) and (4,6)
SET SERVEROUTPUT ON;
DECLARE
  TYPE t_vec IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
  a t_vec; b t_vec;
  s PLS_INTEGER := 0;
BEGIN
  a(1) := 1; a(2) := 2;
  b(1) := 4; b(2) := 6;
  FOR i IN 1 .. 2 LOOP
    s := s + ABS(a(i) - b(i));
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(s);
END;
/
