SET SERVEROUTPUT ON
-- n(n+1)/2+1
BEGIN
  FOR n IN 1 .. 15 LOOP
    DBMS_OUTPUT.PUT_LINE(n || ' -> ' || ((n * (n + 1)) / 2) + 1);
  END LOOP;
END;
/
