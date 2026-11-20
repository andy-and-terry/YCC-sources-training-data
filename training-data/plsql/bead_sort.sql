-- Bead (gravity) sort using nested tables.
DECLARE
  TYPE num_tab IS TABLE OF PLS_INTEGER;
  nums num_tab := num_tab(5, 3, 1, 4, 2);
  cols num_tab := num_tab();
  c PLS_INTEGER;
  result VARCHAR2(100);
BEGIN
  FOR i IN 1 .. 5 LOOP
    c := 0;
    FOR j IN 1 .. nums.COUNT LOOP IF nums(j) >= i THEN c := c + 1; END IF; END LOOP;
    cols.EXTEND; cols(cols.COUNT) := c;
  END LOOP;
  FOR r IN REVERSE 1 .. 5 LOOP
    c := 0;
    FOR i IN 1 .. cols.COUNT LOOP IF cols(i) >= 6 - r THEN c := c + 1; END IF; END LOOP;
    result := result || c || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(result);
END;
/
