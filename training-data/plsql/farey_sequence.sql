SET SERVEROUTPUT ON

-- Farey sequence F_n: reduced fractions in [0,1] with denominator <= n
DECLARE
    n NUMBER := 5;
    a NUMBER := 0;
    b NUMBER := 1;
    c NUMBER := 1;
    d NUMBER := 5;
    k NUMBER;
    e NUMBER;
    f NUMBER;
    result VARCHAR2(200);
BEGIN
    result := a || '/' || b;
    WHILE c <= n LOOP
        k := TRUNC((n + b) / d);
        e := k * c - a;
        f := k * d - b;
        a := c;
        b := d;
        c := e;
        d := f;
        result := result || ' ' || a || '/' || b;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
