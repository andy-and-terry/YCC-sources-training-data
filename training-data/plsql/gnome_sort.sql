DECLARE
    TYPE int_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    a   int_tab;
    pos PLS_INTEGER := 1;
    tmp NUMBER;
    out VARCHAR2(200);
BEGIN
    a(1) := 5; a(2) := 3; a(3) := 8; a(4) := 1; a(5) := 9; a(6) := 2;
    WHILE pos <= a.COUNT LOOP
        IF pos = 1 OR a(pos) >= a(pos - 1) THEN
            pos := pos + 1;
        ELSE
            tmp := a(pos);
            a(pos) := a(pos - 1);
            a(pos - 1) := tmp;
            pos := pos - 1;
        END IF;
    END LOOP;
    FOR i IN 1 .. a.COUNT LOOP
        out := out || a(i) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RTRIM(out));
END;
/
