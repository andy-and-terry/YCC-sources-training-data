-- Lattice paths via the binomial coefficient C(2n, n) computed iteratively.
DECLARE
  n CONSTANT PLS_INTEGER := 3;
  r NUMBER := 1;
BEGIN
  FOR i IN 1 .. n LOOP
    r := r * (n + i) / i;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(r);
END;
/
