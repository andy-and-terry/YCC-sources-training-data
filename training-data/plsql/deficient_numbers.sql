-- Deficient numbers below 100; expect 76.
SET SERVEROUTPUT ON
DECLARE
  c PLS_INTEGER := 0;
  FUNCTION proper_sum(n IN PLS_INTEGER) RETURN PLS_INTEGER IS
    t PLS_INTEGER := 0;
  BEGIN
    FOR d IN 1 .. n - 1 LOOP
      IF MOD(n, d) = 0 THEN t := t + d; END IF;
    END LOOP;
    RETURN t;
  END proper_sum;
BEGIN
  FOR n IN 1 .. 99 LOOP
    IF proper_sum(n) < n THEN c := c + 1; END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(c);
END;
/
