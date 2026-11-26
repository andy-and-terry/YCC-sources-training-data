-- Squarefree numbers up to 100; expect 61.
SET SERVEROUTPUT ON
DECLARE
  c PLS_INTEGER := 0;
  FUNCTION squarefree(n IN PLS_INTEGER) RETURN BOOLEAN IS
    d PLS_INTEGER := 2;
  BEGIN
    WHILE d * d <= n LOOP
      IF MOD(n, d * d) = 0 THEN RETURN FALSE; END IF;
      d := d + 1;
    END LOOP;
    RETURN TRUE;
  END squarefree;
BEGIN
  FOR n IN 1 .. 100 LOOP
    IF squarefree(n) THEN c := c + 1; END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(c);
END;
/
