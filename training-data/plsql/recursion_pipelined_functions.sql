CREATE OR REPLACE TYPE num_tab AS TABLE OF NUMBER;
/
CREATE OR REPLACE FUNCTION fib_seq(n NUMBER) RETURN num_tab PIPELINED IS
    a NUMBER := 0; b NUMBER := 1; t NUMBER;
BEGIN
    FOR i IN 1 .. n LOOP
        PIPE ROW (a);
        t := a + b; a := b; b := t;
    END LOOP;
    RETURN;
END;
/
CREATE OR REPLACE FUNCTION fact(n NUMBER) RETURN NUMBER IS
BEGIN
    IF n <= 1 THEN RETURN 1; END IF;
    RETURN n * fact(n - 1);
END;
/
SELECT COLUMN_VALUE AS fib FROM TABLE(fib_seq(10));
SELECT fact(10) AS f10 FROM dual;
WITH tree(id, parent, lvl) AS (
    SELECT 1, NULL, 0 FROM dual
    UNION ALL
    SELECT id + 1, id, lvl + 1 FROM tree WHERE lvl < 3)
SELECT id, parent, lvl FROM tree;
