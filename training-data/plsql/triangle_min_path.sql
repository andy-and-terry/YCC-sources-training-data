-- Rows stored as (row_no, col_no, value); fold bottom-up with a recursive CTE.
WITH tri (r, c, v) AS (
    SELECT 1, 1, 2 FROM dual UNION ALL
    SELECT 2, 1, 3 FROM dual UNION ALL SELECT 2, 2, 4 FROM dual UNION ALL
    SELECT 3, 1, 6 FROM dual UNION ALL SELECT 3, 2, 5 FROM dual UNION ALL SELECT 3, 3, 7 FROM dual UNION ALL
    SELECT 4, 1, 4 FROM dual UNION ALL SELECT 4, 2, 1 FROM dual UNION ALL
    SELECT 4, 3, 8 FROM dual UNION ALL SELECT 4, 4, 3 FROM dual
),
best (r, c, total) AS (
    SELECT r, c, v FROM tri WHERE r = 4
    UNION ALL
    SELECT t.r, t.c, t.v + LEAST(b1.total, b2.total)
    FROM tri t
    JOIN best b1 ON b1.r = t.r + 1 AND b1.c = t.c
    JOIN best b2 ON b2.r = t.r + 1 AND b2.c = t.c + 1
)
SELECT total FROM best WHERE r = 1;
-- 11
