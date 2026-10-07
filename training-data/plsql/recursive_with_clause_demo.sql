-- recursive subquery factoring (WITH clause) instead of CONNECT BY
BEGIN
    FOR rec IN (
        WITH numbers (n, factorial) AS (
            SELECT 1, 1 FROM dual
            UNION ALL
            SELECT n + 1, factorial * (n + 1)
            FROM numbers
            WHERE n < 8
        )
        SELECT n, factorial FROM numbers ORDER BY n
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.n || '! = ' || rec.factorial);
    END LOOP;

    FOR rec IN (
        WITH fib (idx, a, b) AS (
            SELECT 1, 0, 1 FROM dual
            UNION ALL
            SELECT idx + 1, b, a + b FROM fib WHERE idx < 10
        )
        SELECT idx, a FROM fib ORDER BY idx
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('fib(' || rec.idx || ') = ' || rec.a);
    END LOOP;
END;
/
