CREATE OR REPLACE FUNCTION gcd(a IN NUMBER, b IN NUMBER) RETURN NUMBER IS
    x NUMBER := a;
    y NUMBER := b;
    temp NUMBER;
BEGIN
    WHILE y != 0 LOOP
        temp := y;
        y := MOD(x, y);
        x := temp;
    END LOOP;
    RETURN x;
END gcd;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(gcd(48, 18));
    DBMS_OUTPUT.PUT_LINE(gcd(100, 75));
END;
/
