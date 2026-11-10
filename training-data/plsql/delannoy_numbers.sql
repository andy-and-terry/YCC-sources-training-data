SET SERVEROUTPUT ON
DECLARE
    TYPE row_t IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE grid_t IS TABLE OF row_t INDEX BY PLS_INTEGER;
    g grid_t;
BEGIN
    FOR i IN 0 .. 5 LOOP
        FOR j IN 0 .. 5 LOOP
            IF i = 0 OR j = 0 THEN
                g(i)(j) := 1;
            ELSE
                g(i)(j) := g(i - 1)(j) + g(i)(j - 1) + g(i - 1)(j - 1);
            END IF;
        END LOOP;
        NULL;
    END LOOP;
    FOR n IN 0 .. 5 LOOP
        DBMS_OUTPUT.PUT(g(n)(n) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;  -- 1 3 13 63 321 1683
END;
/
