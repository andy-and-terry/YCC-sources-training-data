-- Insert [2,5] into sorted, disjoint intervals using plain SQL.
WITH intervals (lo, hi) AS (
    SELECT 1, 3 FROM dual UNION ALL
    SELECT 6, 9 FROM dual
),
merged AS (
    SELECT MIN(lo) AS lo, MAX(hi) AS hi
    FROM (
        SELECT lo, hi FROM intervals WHERE hi >= 2 AND lo <= 5
        UNION ALL
        SELECT 2, 5 FROM dual
    )
)
SELECT lo, hi FROM intervals WHERE hi < 2
UNION ALL
SELECT lo, hi FROM merged
UNION ALL
SELECT lo, hi FROM intervals WHERE lo > 5
ORDER BY lo;
-- (1,5) (6,9)
