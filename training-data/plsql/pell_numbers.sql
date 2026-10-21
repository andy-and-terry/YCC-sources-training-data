SET SERVEROUTPUT ON

-- P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
DECLARE
    a NUMBER := 0;
    b NUMBER := 1;
    t NUMBER;
BEGIN
    FOR i IN 0 .. 14 LOOP
        DBMS_OUTPUT.PUT_LINE('P(' || i || ') = ' || a);
        t := 2 * b + a;
        a := b;
        b := t;
    END LOOP;
END;
/
