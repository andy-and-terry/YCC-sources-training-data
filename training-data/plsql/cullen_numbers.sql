CREATE OR REPLACE FUNCTION cullen(p_n IN NUMBER) RETURN NUMBER IS
BEGIN
    RETURN p_n * POWER(2, p_n) + 1;
END cullen;
/

BEGIN
    FOR n IN 1 .. 5 LOOP
        DBMS_OUTPUT.PUT_LINE(n || ' ' || cullen(n));
    END LOOP;
END;
/
