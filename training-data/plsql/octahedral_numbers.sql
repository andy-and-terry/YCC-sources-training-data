SET SERVEROUTPUT ON
-- n(2n^2+1)/3
BEGIN
  FOR n IN 1 .. 15 LOOP
    DBMS_OUTPUT.PUT_LINE(n || ' -> ' || (n * (((2 * n) * n) + 1)) / 3);
  END LOOP;
END;
/
