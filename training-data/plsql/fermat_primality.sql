-- Fermat primality test; Carmichael number 561 fools it.
SET SERVEROUTPUT ON;
DECLARE
  FUNCTION powmod(b0 NUMBER, e0 NUMBER, m NUMBER) RETURN NUMBER IS
    r NUMBER := 1;
    b NUMBER := MOD(b0, m);
    e NUMBER := e0;
  BEGIN
    WHILE e > 0 LOOP
      IF MOD(e, 2) = 1 THEN
        r := MOD(r * b, m);
      END IF;
      b := MOD(b * b, m);
      e := TRUNC(e / 2);
    END LOOP;
    RETURN r;
  END powmod;

  FUNCTION probably_prime(n NUMBER) RETURN BOOLEAN IS
  BEGIN
    RETURN n > 2 AND powmod(2, n - 1, n) = 1;
  END probably_prime;

  TYPE num_list IS TABLE OF NUMBER;
  tests num_list := num_list(97, 91, 561);
BEGIN
  FOR i IN 1 .. tests.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(tests(i) || ' ' || CASE WHEN probably_prime(tests(i)) THEN 'true' ELSE 'false' END);
  END LOOP;
END;
/
