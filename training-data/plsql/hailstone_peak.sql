-- Highest value reached by the Collatz (hailstone) sequence from n.
SET SERVEROUTPUT ON;
DECLARE
  n    NUMBER := 27;
  best NUMBER := 27;
BEGIN
  WHILE n <> 1 LOOP
    IF MOD(n, 2) = 0 THEN
      n := n / 2;
    ELSE
      n := 3 * n + 1;
    END IF;
    best := GREATEST(best, n);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(best);
END;
/
