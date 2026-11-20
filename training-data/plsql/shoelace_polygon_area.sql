-- Shoelace polygon area with associative arrays.
DECLARE
  TYPE coords IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  x coords; y coords;
  s NUMBER := 0;
  j PLS_INTEGER;
BEGIN
  x(1) := 0; x(2) := 4; x(3) := 4; x(4) := 0;
  y(1) := 0; y(2) := 0; y(3) := 3; y(4) := 3;
  FOR i IN 1 .. 4 LOOP
    j := MOD(i, 4) + 1;
    s := s + x(i) * y(j) - x(j) * y(i);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(ABS(s) / 2);
END;
/
