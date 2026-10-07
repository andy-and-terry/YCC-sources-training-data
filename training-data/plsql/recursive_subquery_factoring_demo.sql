-- Recursive WITH clause (subquery factoring) generating a number series,
-- distinct from the existing CONNECT BY hierarchy demo.
CREATE TABLE employees_crt (
    emp_id NUMBER,
    manager_id NUMBER,
    emp_name VARCHAR2(30)
);

INSERT INTO employees_crt VALUES (1, NULL, 'Alice');
INSERT INTO employees_crt VALUES (2, 1, 'Bob');
INSERT INTO employees_crt VALUES (3, 1, 'Carol');
INSERT INTO employees_crt VALUES (4, 2, 'Dave');

WITH org_chart (emp_id, emp_name, mgr_id, lvl) AS (
    SELECT emp_id, emp_name, manager_id, 1
    FROM employees_crt
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.emp_id, e.emp_name, e.manager_id, oc.lvl + 1
    FROM employees_crt e
    JOIN org_chart oc ON e.manager_id = oc.emp_id
)
SELECT lvl, emp_name
FROM org_chart
ORDER BY lvl, emp_name;
