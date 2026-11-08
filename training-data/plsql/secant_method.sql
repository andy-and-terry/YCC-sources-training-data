CREATE OR REPLACE FUNCTION f(x IN NUMBER) RETURN NUMBER IS
BEGIN
    RETURN x * x - 2;
END f;
/
DECLARE
    a NUMBER := 1;
    b NUMBER := 2;
    c NUMBER;
BEGIN
    FOR i IN 1 .. 40 LOOP
        EXIT WHEN f(b) = f(a);
        c := b - f(b) * (b - a) / (f(b) - f(a));
        a := b;
        b := c;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(b, 'FM0.00000000'));
END;
/
