-- The 12c+ WITH clause can define a PL/SQL function inline inside a
-- single SELECT, avoiding a separate CREATE FUNCTION when the logic is
-- only ever used by that one query.
CREATE TABLE employees_wf (
    emp_id NUMBER PRIMARY KEY,
    name   VARCHAR2(30),
    salary NUMBER
);

INSERT INTO employees_wf VALUES (1, 'Ada', 95000);
INSERT INTO employees_wf VALUES (2, 'Bob', 42000);
INSERT INTO employees_wf VALUES (3, 'Cleo', 61000);

BEGIN
    FOR rec IN (
        WITH
            FUNCTION salary_band(p_salary IN NUMBER) RETURN VARCHAR2 IS
            BEGIN
                IF p_salary >= 80000 THEN
                    RETURN 'senior';
                ELSIF p_salary >= 50000 THEN
                    RETURN 'mid';
                ELSE
                    RETURN 'junior';
                END IF;
            END;
        SELECT name, salary, salary_band(salary) AS band
        FROM employees_wf
        ORDER BY salary DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.name || ': ' || rec.salary || ' (' || rec.band || ')');
    END LOOP;
END;
/
