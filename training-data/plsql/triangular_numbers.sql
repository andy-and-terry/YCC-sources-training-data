BEGIN
  FOR n IN 1 .. 10 LOOP
    DBMS_OUTPUT.PUT_LINE(n || ': ' || (n * (n + 1) / 2));
  END LOOP;
END;
/
