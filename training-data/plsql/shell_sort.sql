DECLARE
    TYPE int_tab IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    a   int_tab;
    gap PLS_INTEGER;
    tmp PLS_INTEGER;
    j   PLS_INTEGER;
    out VARCHAR2(200);
BEGIN
    a(1) := 23; a(2) := 4; a(3) := 42; a(4) := 15; a(5) := 8; a(6) := 16;
    gap := a.COUNT / 2;
    WHILE gap > 0 LOOP
        FOR i IN gap + 1 .. a.COUNT LOOP
            tmp := a(i);
            j := i;
            WHILE j > gap AND a(j - gap) > tmp LOOP
                a(j) := a(j - gap);
                j := j - gap;
            END LOOP;
            a(j) := tmp;
        END LOOP;
        gap := TRUNC(gap / 2);
    END LOOP;
    FOR i IN 1 .. a.COUNT LOOP
        out := out || a(i) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RTRIM(out));
END;
/
