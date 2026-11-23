SET SERVEROUTPUT ON
-- n(n+1)(2n+1)/6
BEGIN
  FOR n IN 1 .. 15 LOOP
    DBMS_OUTPUT.PUT_LINE(n || ' -> ' || ((n * (n + 1)) * ((2 * n) + 1)) / 6);
  END LOOP;
END;
/
