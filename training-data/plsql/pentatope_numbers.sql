SET SERVEROUTPUT ON
-- n(n+1)(n+2)(n+3)/24
BEGIN
  FOR n IN 1 .. 15 LOOP
    DBMS_OUTPUT.PUT_LINE(n || ' -> ' || (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24);
  END LOOP;
END;
/
