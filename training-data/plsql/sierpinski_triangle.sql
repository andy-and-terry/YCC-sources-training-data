DECLARE
  n CONSTANT PLS_INTEGER := 8;
  line VARCHAR2(40);
BEGIN
  FOR r IN 0 .. n - 1 LOOP
    line := RPAD(' ', n - r - 1);
    FOR c IN 0 .. r LOOP
      line := line || CASE WHEN BITAND(r, c) = c THEN '* ' ELSE '  ' END;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(line);
  END LOOP;
END;
/
