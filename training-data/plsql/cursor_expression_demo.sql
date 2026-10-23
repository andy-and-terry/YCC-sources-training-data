-- A CURSOR(...) expression nests a child result set inside each parent row.
DECLARE
    CURSOR dept_cur IS
        SELECT d.department_name,
               CURSOR(SELECT e.last_name, e.salary
                        FROM employees e
                       WHERE e.department_id = d.department_id
                       ORDER BY e.salary DESC) AS staff
          FROM departments d
         WHERE d.department_id IN (10, 20);

    v_dept_name departments.department_name%TYPE;
    v_staff     SYS_REFCURSOR;
    v_last_name employees.last_name%TYPE;
    v_salary    employees.salary%TYPE;
BEGIN
    OPEN dept_cur;
    LOOP
        FETCH dept_cur INTO v_dept_name, v_staff;
        EXIT WHEN dept_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Department: ' || v_dept_name);
        LOOP
            FETCH v_staff INTO v_last_name, v_salary;
            EXIT WHEN v_staff%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('  ' || RPAD(v_last_name, 15) || v_salary);
        END LOOP;
    END LOOP;
    CLOSE dept_cur;
END;
/
