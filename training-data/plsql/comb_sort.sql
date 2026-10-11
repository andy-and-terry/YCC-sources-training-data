DECLARE
    TYPE int_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    a        int_tab;
    gap      PLS_INTEGER;
    swapped  BOOLEAN := TRUE;
    tmp      NUMBER;
    out      VARCHAR2(200);
BEGIN
    a(1) := 8; a(2) := 4; a(3) := 1; a(4) := 56; a(5) := 3; a(6) := -44; a(7) := 23;
    gap := a.COUNT;
    WHILE gap > 1 OR swapped LOOP
        gap := GREATEST(TRUNC(gap / 1.3), 1);
        swapped := FALSE;
        FOR i IN 1 .. a.COUNT - gap LOOP
            IF a(i) > a(i + gap) THEN
                tmp := a(i); a(i) := a(i + gap); a(i + gap) := tmp;
                swapped := TRUE;
            END IF;
        END LOOP;
    END LOOP;
    FOR i IN 1 .. a.COUNT LOOP
        out := out || a(i) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RTRIM(out));
END;
/
