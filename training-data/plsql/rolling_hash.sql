DECLARE
  s CONSTANT VARCHAR2(10) := 'abcabc';
  k CONSTANT PLS_INTEGER := 3;
  h PLS_INTEGER;
BEGIN
  FOR i IN 1 .. LENGTH(s) - k + 1 LOOP
    h := 0;
    FOR j IN i .. i + k - 1 LOOP
      h := MOD(h * 31 + ASCII(SUBSTR(s, j, 1)), 1000003);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE((i - 1) || ' ' || h);
  END LOOP;
END;
/
