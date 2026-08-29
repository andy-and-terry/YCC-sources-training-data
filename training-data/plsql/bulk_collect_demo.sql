CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE PROCEDURE bulk_collect_demo IS
    numbers int_table;
BEGIN
    SELECT LEVEL BULK COLLECT INTO numbers
    FROM DUAL CONNECT BY LEVEL <= 10;

    FOR i IN 1..numbers.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(numbers(i) * numbers(i));
    END LOOP;
END bulk_collect_demo;
/
