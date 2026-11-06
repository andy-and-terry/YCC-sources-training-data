-- Amicable pairs: d(a) = b and d(b) = a with a <> b.
SET SERVEROUTPUT ON;
DECLARE
  FUNCTION d(n PLS_INTEGER) RETURN PLS_INTEGER IS
    s PLS_INTEGER := 0;
  BEGIN
    FOR i IN 1 .. n - 1 LOOP
      IF MOD(n, i) = 0 THEN
        s := s + i;
      END IF;
    END LOOP;
    RETURN s;
  END d;
  b PLS_INTEGER;
BEGIN
  FOR a IN 2 .. 1499 LOOP
    b := d(a);
    IF b > a AND d(b) = a THEN
      DBMS_OUTPUT.PUT_LINE(a || ' ' || b);
    END IF;
  END LOOP;
END;
/
