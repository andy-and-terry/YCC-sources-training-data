-- Deficient numbers up to 20 using plain SQL
SELECT n
FROM (SELECT LEVEL AS n FROM dual CONNECT BY LEVEL <= 20) nums
WHERE (SELECT SUM(d) FROM (SELECT LEVEL AS d FROM dual CONNECT BY LEVEL <= 20) divs
       WHERE d <= nums.n AND MOD(nums.n, d) = 0) < 2 * n
ORDER BY n;
