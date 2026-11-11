-- Population count (number of set bits) for 0..15
SET SERVEROUTPUT ON;

DECLARE
    FUNCTION bits(p_n IN PLS_INTEGER) RETURN PLS_INTEGER IS
        x PLS_INTEGER := p_n;
        c PLS_INTEGER := 0;
    BEGIN
        WHILE x > 0 LOOP
            c := c + MOD(x, 2);
            x := TRUNC(x / 2);
        END LOOP;
        RETURN c;
    END bits;
BEGIN
    FOR n IN 0 .. 15 LOOP
        DBMS_OUTPUT.PUT(bits(n) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/
