-- Second largest distinct salary, three ways.
SELECT MAX(salary) AS second_largest
FROM   employees
WHERE  salary < (SELECT MAX(salary) FROM employees);

SELECT salary AS second_largest
FROM  (SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk FROM employees)
WHERE  rnk = 2
FETCH FIRST 1 ROW ONLY;

SELECT salary
FROM   employees
ORDER  BY salary DESC
OFFSET 1 ROW FETCH NEXT 1 ROW ONLY;
