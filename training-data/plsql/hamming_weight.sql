-- Population count with BITAND
SET SERVEROUTPUT ON;
DECLARE
  n PLS_INTEGER := 183;
  c PLS_INTEGER := 0;
BEGIN
  WHILE n > 0 LOOP
    n := BITAND(n, n - 1);
    c := c + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(c);
END;
/
