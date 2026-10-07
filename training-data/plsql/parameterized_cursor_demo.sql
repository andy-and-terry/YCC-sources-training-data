-- A cursor parameter is scoped to the cursor and re-evaluated on each
-- OPEN, so the same cursor definition can be reused with different
-- argument values instead of writing a separate query per filter.
CREATE TABLE staff (
    staff_id   NUMBER PRIMARY KEY,
    dept_id    NUMBER,
    staff_name VARCHAR2(30),
    salary     NUMBER
);

INSERT INTO staff VALUES (1, 10, 'Ada', 5000);
INSERT INTO staff VALUES (2, 10, 'Bob', 2800);
INSERT INTO staff VALUES (3, 10, 'Cleo', 4200);
INSERT INTO staff VALUES (4, 20, 'Dinesh', 3900);
INSERT INTO staff VALUES (5, 20, 'Eve', 6100);

DECLARE
    CURSOR dept_cursor(p_dept_id IN NUMBER, p_min_salary IN NUMBER) IS
        SELECT staff_name, salary
        FROM staff
        WHERE dept_id = p_dept_id
          AND salary >= p_min_salary
        ORDER BY salary DESC;

    v_staff_name staff.staff_name%TYPE;
    v_salary     staff.salary%TYPE;
BEGIN
    FOR rec IN dept_cursor(p_dept_id => 10, p_min_salary => 3000) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.staff_name || ': ' || rec.salary);
    END LOOP;

    -- same cursor, different parameter values, driven explicitly this time
    OPEN dept_cursor(p_dept_id => 20, p_min_salary => 0);
    LOOP
        FETCH dept_cursor INTO v_staff_name, v_salary;
        EXIT WHEN dept_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_staff_name || ': ' || v_salary || ' (row ' || dept_cursor%ROWCOUNT || ')');
    END LOOP;
    CLOSE dept_cursor;
END;
/
