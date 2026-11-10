SET SERVEROUTPUT ON
-- Twin prime pairs below 80 using a set-based query over generated rows.
WITH nums AS (SELECT LEVEL + 1 AS n FROM DUAL CONNECT BY LEVEL <= 79),
primes AS (
    SELECT n FROM nums a
    WHERE NOT EXISTS (SELECT 1 FROM nums b WHERE b.n < a.n AND b.n * b.n <= a.n AND MOD(a.n, b.n) = 0)
)
SELECT p.n AS lo, q.n AS hi
FROM primes p JOIN primes q ON q.n = p.n + 2
ORDER BY p.n;
-- (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
