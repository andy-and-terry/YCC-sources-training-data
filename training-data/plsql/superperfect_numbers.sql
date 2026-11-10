SET SERVEROUTPUT ON
DECLARE
    FUNCTION sigma(n NUMBER) RETURN NUMBER IS
        s NUMBER := 0;
    BEGIN
        FOR d IN 1 .. n LOOP
            IF MOD(n, d) = 0 THEN s := s + d; END IF;
        END LOOP;
        RETURN s;
    END;
BEGIN
    FOR n IN 1 .. 99 LOOP
        IF sigma(sigma(n)) = 2 * n THEN
            DBMS_OUTPUT.PUT(n || ' ');
        END IF;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;  -- 2 4 16 64
END;
/
