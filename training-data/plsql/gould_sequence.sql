SET SERVEROUTPUT ON;
DECLARE
  v_out VARCHAR2(100);
  FUNCTION popcount(n PLS_INTEGER) RETURN PLS_INTEGER IS
    m PLS_INTEGER := n;
    c PLS_INTEGER := 0;
  BEGIN
    WHILE m > 0 LOOP
      c := c + MOD(m, 2);
      m := TRUNC(m / 2);
    END LOOP;
    RETURN c;
  END;
BEGIN
  FOR n IN 0 .. 15 LOOP
    v_out := v_out || POWER(2, popcount(n)) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(v_out);
END;
/
