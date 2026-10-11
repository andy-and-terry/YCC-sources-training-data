DECLARE
    v_id     employees.employee_id%TYPE := 100;
    v_old    employees.salary%TYPE;
    v_new    employees.salary%TYPE;
    TYPE id_tab IS TABLE OF employees.employee_id%TYPE;
    v_ids    id_tab;
BEGIN
    UPDATE employees
       SET salary = salary * 1.1
     WHERE employee_id = v_id
    RETURNING salary / 1.1, salary INTO v_old, v_new;
    DBMS_OUTPUT.PUT_LINE('salary ' || ROUND(v_old, 2) || ' -> ' || v_new);

    DELETE FROM employees
     WHERE department_id = 270
    RETURNING employee_id BULK COLLECT INTO v_ids;
    DBMS_OUTPUT.PUT_LINE('deleted ' || v_ids.COUNT || ' employees');
    ROLLBACK;
END;
/
