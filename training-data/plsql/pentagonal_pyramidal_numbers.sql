SET SERVEROUTPUT ON
-- n^2(n+1)/2
BEGIN
  FOR n IN 1 .. 15 LOOP
    DBMS_OUTPUT.PUT_LINE(n || ' -> ' || ((n * n) * (n + 1)) / 2);
  END LOOP;
END;
/
