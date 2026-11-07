-- Count (a, b, c, d) tuples summing to zero by joining pair sums.
WITH a (v) AS (SELECT 1 FROM dual UNION ALL SELECT 2 FROM dual),
     b (v) AS (SELECT -2 FROM dual UNION ALL SELECT -1 FROM dual),
     c (v) AS (SELECT -1 FROM dual UNION ALL SELECT 2 FROM dual),
     d (v) AS (SELECT 0 FROM dual UNION ALL SELECT 2 FROM dual),
     ab AS (SELECT a.v + b.v AS s FROM a CROSS JOIN b),
     cd AS (SELECT -(c.v + d.v) AS s FROM c CROSS JOIN d)
SELECT COUNT(*) AS tuples
FROM ab JOIN cd ON ab.s = cd.s;
-- 2
