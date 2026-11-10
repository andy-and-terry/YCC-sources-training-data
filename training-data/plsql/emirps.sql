SET SERVEROUTPUT ON
DECLARE
    TYPE num_list IS TABLE OF NUMBER;
    found num_list := num_list();
    n     NUMBER := 2;
    r     NUMBER;
    FUNCTION is_prime(p NUMBER) RETURN BOOLEAN IS
        i NUMBER := 2;
    BEGIN
        IF p < 2 THEN RETURN FALSE; END IF;
        WHILE i * i <= p LOOP
            IF MOD(p, i) = 0 THEN RETURN FALSE; END IF;
            i := i + 1;
        END LOOP;
        RETURN TRUE;
    END;
BEGIN
    WHILE found.COUNT < 10 LOOP
        r := TO_NUMBER(REVERSE(TO_CHAR(n)));
        IF r <> n AND is_prime(n) AND is_prime(r) THEN
            found.EXTEND;
            found(found.COUNT) := n;
            DBMS_OUTPUT.PUT(n || ' ');
        END IF;
        n := n + 1;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;  -- 13 17 31 37 71 73 79 97 107 113
END;
/
