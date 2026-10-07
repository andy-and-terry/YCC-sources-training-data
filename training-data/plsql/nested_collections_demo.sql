CREATE OR REPLACE PROCEDURE nested_collections_demo IS
    TYPE int_row   IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    TYPE int_grid  IS TABLE OF int_row INDEX BY PLS_INTEGER;
    v_grid int_grid;
BEGIN
    FOR r IN 1 .. 3 LOOP
        FOR c IN 1 .. 3 LOOP
            v_grid(r)(c) := r * c;
        END LOOP;
    END LOOP;

    FOR r IN 1 .. v_grid.COUNT LOOP
        DECLARE
            v_line VARCHAR2(100);
        BEGIN
            FOR c IN 1 .. v_grid(r).COUNT LOOP
                v_line := v_line || LPAD(v_grid(r)(c), 4);
            END LOOP;
            DBMS_OUTPUT.PUT_LINE(v_line);
        END;
    END LOOP;
END nested_collections_demo;
/
