CREATE TABLE employees_hier (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    manager_id NUMBER
);

INSERT INTO employees_hier VALUES (1, 'Alice', NULL);
INSERT INTO employees_hier VALUES (2, 'Bob', 1);
INSERT INTO employees_hier VALUES (3, 'Carol', 1);
INSERT INTO employees_hier VALUES (4, 'Dave', 2);
INSERT INTO employees_hier VALUES (5, 'Eve', 2);

CREATE OR REPLACE PROCEDURE print_org_chart IS
BEGIN
    FOR rec IN (
        SELECT LPAD(' ', 2 * (LEVEL - 1)) || emp_name AS indented_name, LEVEL AS depth
        FROM employees_hier
        START WITH manager_id IS NULL
        CONNECT BY PRIOR emp_id = manager_id
        ORDER SIBLINGS BY emp_name
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.indented_name);
    END LOOP;
END print_org_chart;
/
