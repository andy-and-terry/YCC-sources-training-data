CREATE OR REPLACE PROCEDURE cursor_loop_demo IS
    CURSOR num_cursor IS
        SELECT LEVEL AS n FROM DUAL CONNECT BY LEVEL <= 10;
BEGIN
    FOR rec IN num_cursor LOOP
        IF MOD(rec.n, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(rec.n);
        END IF;
    END LOOP;
END cursor_loop_demo;
/
