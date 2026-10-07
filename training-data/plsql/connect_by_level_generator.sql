CREATE OR REPLACE PROCEDURE connect_by_level_generator IS
BEGIN
    -- Row generator: squares and running totals without any table.
    FOR r IN (
        SELECT LEVEL AS n,
               LEVEL * LEVEL AS sq,
               SUM(LEVEL * LEVEL) OVER (ORDER BY LEVEL) AS running
          FROM dual
       CONNECT BY LEVEL <= 6
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(r.n || ' ' || r.sq || ' ' || r.running);
    END LOOP;

    FOR r IN (
        SELECT TO_CHAR(DATE '2024-02-26' + LEVEL - 1, 'DY DD') AS d
          FROM dual
       CONNECT BY LEVEL <= 5
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(r.d);
    END LOOP;
END connect_by_level_generator;
/
