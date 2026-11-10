SET SERVEROUTPUT ON
DECLARE
    found NUMBER := 0;
    p     NUMBER := 2;
    FUNCTION is_prime(n NUMBER) RETURN BOOLEAN IS
        i NUMBER := 2;
    BEGIN
        IF n < 2 THEN RETURN FALSE; END IF;
        WHILE i * i <= n LOOP
            IF MOD(n, i) = 0 THEN RETURN FALSE; END IF;
            i := i + 1;
        END LOOP;
        RETURN TRUE;
    END;
BEGIN
    WHILE found < 10 LOOP
        IF is_prime(p) AND is_prime(2 * p + 1) THEN
            DBMS_OUTPUT.PUT(p || ' ');
            found := found + 1;
        END IF;
        p := p + 1;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;  -- 2 3 5 11 23 29 41 53 83 89
END;
/
