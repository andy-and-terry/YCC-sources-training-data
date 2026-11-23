SET SERVEROUTPUT ON
-- 3n(n-1)+1
BEGIN
  FOR n IN 1 .. 15 LOOP
    DBMS_OUTPUT.PUT_LINE(n || ' -> ' || ((3 * n) * (n - 1)) + 1);
  END LOOP;
END;
/
