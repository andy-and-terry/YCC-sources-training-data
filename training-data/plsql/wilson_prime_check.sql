-- Wilson's theorem primality test.
DECLARE
  f NUMBER;
BEGIN
  FOR n IN 2 .. 19 LOOP
    f := 1;
    FOR i IN 2 .. n - 1 LOOP f := MOD(f * i, n); END LOOP;
    IF f = n - 1 THEN DBMS_OUTPUT.PUT_LINE(n || ' is prime'); END IF;
  END LOOP;
END;
/
