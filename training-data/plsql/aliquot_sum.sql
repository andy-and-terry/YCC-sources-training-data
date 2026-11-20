-- Aliquot sum classification with a hierarchical generator and CASE.
SELECT n,
       (SELECT NVL(SUM(d), 0) FROM (SELECT LEVEL d FROM dual CONNECT BY LEVEL < t.n) WHERE MOD(t.n, d) = 0) AS aliquot,
       CASE
         WHEN (SELECT NVL(SUM(d), 0) FROM (SELECT LEVEL d FROM dual CONNECT BY LEVEL < t.n) WHERE MOD(t.n, d) = 0) = n THEN 'perfect'
         WHEN (SELECT NVL(SUM(d), 0) FROM (SELECT LEVEL d FROM dual CONNECT BY LEVEL < t.n) WHERE MOD(t.n, d) = 0) > n THEN 'abundant'
         ELSE 'deficient'
       END AS kind
FROM (SELECT 6 n FROM dual UNION ALL SELECT 12 FROM dual UNION ALL SELECT 15 FROM dual UNION ALL SELECT 28 FROM dual) t;
