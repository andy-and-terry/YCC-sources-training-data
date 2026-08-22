DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, salary FROM employees WHERE department_id = 10;
    v_id employees.employee_id%TYPE;
    v_salary employees.salary%TYPE;
    v_total NUMBER := 0;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_id, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;
        v_total := v_total + v_salary;
        DBMS_OUTPUT.PUT_LINE('Employee ' || v_id || ': ' || v_salary);
    END LOOP;
    CLOSE emp_cursor;
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
END;
/
