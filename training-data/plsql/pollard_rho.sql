DECLARE
  FUNCTION rho(n NUMBER) RETURN NUMBER IS
    x NUMBER := 2; y NUMBER := 2; d NUMBER := 1;
    FUNCTION f(v NUMBER) RETURN NUMBER IS BEGIN RETURN MOD(v * v + 1, n); END;
    FUNCTION g(a NUMBER, b NUMBER) RETURN NUMBER IS
    BEGIN
      IF b = 0 THEN RETURN a; END IF;
      RETURN g(b, MOD(a, b));
    END;
  BEGIN
    IF MOD(n, 2) = 0 THEN RETURN 2; END IF;
    WHILE d = 1 LOOP
      x := f(x);
      y := f(f(y));
      d := g(ABS(x - y), n);
    END LOOP;
    RETURN d;
  END;
BEGIN
  DBMS_OUTPUT.PUT_LINE('8051 = ' || rho(8051) || ' * ' || 8051 / rho(8051));
END;
/
