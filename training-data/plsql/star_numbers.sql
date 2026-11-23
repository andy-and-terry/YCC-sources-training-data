SET SERVEROUTPUT ON
-- 6n(n-1)+1
BEGIN
  FOR n IN 1 .. 15 LOOP
    DBMS_OUTPUT.PUT_LINE(n || ' -> ' || ((6 * n) * (n - 1)) + 1);
  END LOOP;
END;
/
