DECLARE
    FUNCTION is_odd(n PLS_INTEGER) RETURN BOOLEAN;

    FUNCTION is_even(n PLS_INTEGER) RETURN BOOLEAN IS
    BEGIN
        IF n = 0 THEN RETURN TRUE; END IF;
        RETURN is_odd(n - 1);
    END;

    FUNCTION is_odd(n PLS_INTEGER) RETURN BOOLEAN IS
    BEGIN
        IF n = 0 THEN RETURN FALSE; END IF;
        RETURN is_even(n - 1);
    END;
BEGIN
    FOR n IN 0 .. 5 LOOP
        DBMS_OUTPUT.PUT_LINE(n || ' is ' || CASE WHEN is_even(n) THEN 'even' ELSE 'odd' END);
    END LOOP;
END;
/
