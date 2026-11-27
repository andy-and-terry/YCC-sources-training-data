SET SERVEROUTPUT ON;
DECLARE
  x0 NUMBER := 1;
  x1 NUMBER := 2;
  f0 NUMBER;
  f1 NUMBER;
  nx NUMBER;
  FUNCTION f(x NUMBER) RETURN NUMBER IS BEGIN RETURN x * x - 2; END;
BEGIN
  FOR i IN 1 .. 50 LOOP
    f0 := f(x0);
    f1 := f(x1);
    EXIT WHEN f1 = f0;
    nx := x1 - f1 * (x1 - x0) / (f1 - f0);
    x0 := x1;
    x1 := nx;
    EXIT WHEN ABS(x1 - x0) < 1E-12;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(x1, 'FM0.0000000000'));
END;
/
