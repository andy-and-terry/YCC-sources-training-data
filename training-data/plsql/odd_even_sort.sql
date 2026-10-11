DECLARE
    TYPE int_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    a      int_tab;
    sorted BOOLEAN := FALSE;
    tmp    NUMBER;
    start_i PLS_INTEGER;
    out    VARCHAR2(200);
BEGIN
    a(1) := 9; a(2) := 7; a(3) := 5; a(4) := 3; a(5) := 1; a(6) := 2;
    WHILE NOT sorted LOOP
        sorted := TRUE;
        FOR phase IN 0 .. 1 LOOP
            start_i := 1 + phase;
            FOR i IN 0 .. TRUNC((a.COUNT - start_i) / 2) LOOP
                IF start_i + 2 * i + 1 <= a.COUNT THEN
                    IF a(start_i + 2 * i) > a(start_i + 2 * i + 1) THEN
                        tmp := a(start_i + 2 * i);
                        a(start_i + 2 * i) := a(start_i + 2 * i + 1);
                        a(start_i + 2 * i + 1) := tmp;
                        sorted := FALSE;
                    END IF;
                END IF;
            END LOOP;
        END LOOP;
    END LOOP;
    FOR i IN 1 .. a.COUNT LOOP
        out := out || a(i) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RTRIM(out));
END;
/
