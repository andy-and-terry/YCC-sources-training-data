SET SERVEROUTPUT ON
DECLARE
    -- Read the binary digits of i as base-4 digits.
    FUNCTION moser(i PLS_INTEGER) RETURN NUMBER IS
        x     PLS_INTEGER := i;
        value NUMBER := 0;
        power NUMBER := 1;
    BEGIN
        WHILE x > 0 LOOP
            IF MOD(x, 2) = 1 THEN value := value + power; END IF;
            power := power * 4;
            x := TRUNC(x / 2);
        END LOOP;
        RETURN value;
    END;
BEGIN
    FOR i IN 0 .. 9 LOOP
        DBMS_OUTPUT.PUT(moser(i) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;  -- 0 1 4 5 16 17 20 21 64 65
END;
/
