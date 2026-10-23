-- Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
SET SERVEROUTPUT ON;

DECLARE
    a NUMBER := 0;
    b NUMBER := 0;
    c NUMBER := 1;
    nxt NUMBER;
BEGIN
    FOR i IN 0 .. 14 LOOP
        DBMS_OUTPUT.PUT_LINE('T(' || i || ') = ' || a);
        nxt := a + b + c;
        a := b;
        b := c;
        c := nxt;
    END LOOP;
END;
/
