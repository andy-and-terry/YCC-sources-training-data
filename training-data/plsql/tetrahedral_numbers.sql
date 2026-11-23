SET SERVEROUTPUT ON
-- n(n+1)(n+2)/6
BEGIN
  FOR n IN 1 .. 15 LOOP
    DBMS_OUTPUT.PUT_LINE(n || ' -> ' || ((n * (n + 1)) * (n + 2)) / 6);
  END LOOP;
END;
/
