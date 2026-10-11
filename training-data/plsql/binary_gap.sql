DECLARE
    n       PLS_INTEGER := 1041;
    best    PLS_INTEGER := 0;
    current PLS_INTEGER := 0;
    seen_one BOOLEAN := FALSE;
    bits    VARCHAR2(64);
    m       PLS_INTEGER := n;
BEGIN
    WHILE m > 0 LOOP
        bits := MOD(m, 2) || bits;
        m := TRUNC(m / 2);
    END LOOP;
    FOR i IN 1 .. LENGTH(bits) LOOP
        IF SUBSTR(bits, i, 1) = '1' THEN
            IF seen_one THEN best := GREATEST(best, current); END IF;
            seen_one := TRUE;
            current := 0;
        ELSE
            current := current + 1;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(n || ' = ' || bits || ' -> longest gap ' || best);
END;
/
