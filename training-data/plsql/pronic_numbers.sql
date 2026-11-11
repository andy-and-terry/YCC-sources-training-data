-- Pronic numbers n(n+1)
SET SERVEROUTPUT ON;

DECLARE
    FUNCTION term(n IN NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN TRUNC(n * (n + 1));
    END term;
BEGIN
    FOR n IN 0 .. 9 LOOP
        DBMS_OUTPUT.PUT(term(n) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/
