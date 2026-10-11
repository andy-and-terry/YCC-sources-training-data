DECLARE
    TYPE int_tab IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    a     int_tab;
    b     int_tab;
    cnt   int_tab;
    exp   PLS_INTEGER := 1;
    maxv  PLS_INTEGER := 0;
    d     PLS_INTEGER;
    out   VARCHAR2(200);
BEGIN
    a(1) := 170; a(2) := 45; a(3) := 75; a(4) := 90; a(5) := 802; a(6) := 24; a(7) := 2; a(8) := 66;
    FOR i IN 1 .. a.COUNT LOOP
        maxv := GREATEST(maxv, a(i));
    END LOOP;
    WHILE TRUNC(maxv / exp) > 0 LOOP
        FOR k IN 0 .. 9 LOOP cnt(k) := 0; END LOOP;
        FOR i IN 1 .. a.COUNT LOOP
            d := MOD(TRUNC(a(i) / exp), 10);
            cnt(d) := cnt(d) + 1;
        END LOOP;
        FOR k IN 1 .. 9 LOOP cnt(k) := cnt(k) + cnt(k - 1); END LOOP;
        FOR i IN REVERSE 1 .. a.COUNT LOOP
            d := MOD(TRUNC(a(i) / exp), 10);
            b(cnt(d)) := a(i);
            cnt(d) := cnt(d) - 1;
        END LOOP;
        a := b;
        exp := exp * 10;
    END LOOP;
    FOR i IN 1 .. a.COUNT LOOP
        out := out || a(i) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(RTRIM(out));
END;
/
