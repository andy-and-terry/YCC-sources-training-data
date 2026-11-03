DECLARE
  TYPE t_nums IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  l_values t_nums;
  l_prefix t_nums;
BEGIN
  l_values(1) := 3; l_values(2) := 1; l_values(3) := 4; l_values(4) := 1;
  l_values(5) := 5; l_values(6) := 9; l_values(7) := 2; l_values(8) := 6;

  l_prefix(0) := 0;
  FOR i IN 1 .. l_values.COUNT LOOP
    l_prefix(i) := l_prefix(i - 1) + l_values(i);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE(l_prefix(5) - l_prefix(2));
END;
/
