-- LISTAGG groups values into a delimited string.
WITH staff AS (
    SELECT 'eng' AS dept, 'Zoe' AS name FROM dual UNION ALL
    SELECT 'eng', 'Adam' FROM dual UNION ALL
    SELECT 'ops', 'Cy' FROM dual UNION ALL
    SELECT 'eng', 'Bea' FROM dual UNION ALL
    SELECT 'ops', 'Di' FROM dual
)
SELECT dept,
       COUNT(*) AS headcount,
       LISTAGG(name, ', ') WITHIN GROUP (ORDER BY name) AS members
  FROM staff
 GROUP BY dept
 ORDER BY dept;
