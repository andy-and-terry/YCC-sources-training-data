DECLARE
    TYPE row_t IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE matrix_t IS TABLE OF row_t INDEX BY PLS_INTEGER;
    m matrix_t;
    t matrix_t;
    line VARCHAR2(100);
BEGIN
    FOR i IN 1 .. 2 LOOP
        FOR j IN 1 .. 3 LOOP
            m(i)(j) := (i - 1) * 3 + j;
        END LOOP;
    END LOOP;
    FOR i IN 1 .. 2 LOOP
        FOR j IN 1 .. 3 LOOP
            t(j)(i) := m(i)(j);
        END LOOP;
    END LOOP;
    FOR j IN 1 .. t.COUNT LOOP
        line := NULL;
        FOR i IN 1 .. t(j).COUNT LOOP
            line := line || LPAD(t(j)(i), 3);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(line);
    END LOOP;
END;
/
