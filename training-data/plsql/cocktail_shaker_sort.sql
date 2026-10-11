DECLARE
    TYPE int_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    a       int_tab;
    lo      PLS_INTEGER;
    hi      PLS_INTEGER;
    swapped BOOLEAN := TRUE;
    tmp     NUMBER;
    out     VARCHAR2(200);
BEGIN
    a(1) := 5; a(2) := 1; a(3) := 4; a(4) := 2; a(5) := 8; a(6) := 0;
    lo := 1;
    hi := a.COUNT;
    WHILE swapped LOOP
        swapped := FALSE;
        FOR i IN lo .. hi - 1 LOOP
            IF a(i) > a(i + 1) THEN
                tmp := a(i); a(i) := a(i + 1); a(i + 1) := tmp;
                swapped := TRUE;
            END IF;
        END LOOP;
        hi := hi - 1;
        FOR i IN REVERSE lo .. hi - 1 LOOP
            IF a(i) > a(i + 1) THEN
                tmp := a(i); a(i) := a(i + 1); a(i + 1) := tmp;
                swapped := TRUE;
            END IF;
        END LOOP;
        lo := lo + 1;
    END LOOP;
    FOR i IN 1 .. a.COUNT LOOP
        out := out || a(i) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RTRIM(out));
END;
/
