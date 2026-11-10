-- Refactorable numbers: n divisible by its own divisor count.
SELECT n
FROM (SELECT LEVEL AS n FROM DUAL CONNECT BY LEVEL <= 59) nums
WHERE MOD(n, (SELECT COUNT(*) FROM (SELECT LEVEL AS d FROM DUAL CONNECT BY LEVEL <= nums.n) WHERE MOD(nums.n, d) = 0)) = 0
ORDER BY n;
-- 1 2 8 9 12 18 24 36 40 56
