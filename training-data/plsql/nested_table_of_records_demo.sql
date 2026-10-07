-- A PL/SQL-only collection type (not a SQL object type, since a record
-- can't be a nested table's element type at the schema level) holding a
-- record per element, indexed by PLS_INTEGER.
DECLARE
    TYPE employee_rec IS RECORD (
        emp_id   NUMBER,
        emp_name VARCHAR2(30),
        salary   NUMBER
    );
    TYPE employee_tab IS TABLE OF employee_rec INDEX BY PLS_INTEGER;

    v_employees employee_tab;
    v_total     NUMBER := 0;
    v_idx       PLS_INTEGER;
BEGIN
    v_employees(1).emp_id := 100; v_employees(1).emp_name := 'Ada';   v_employees(1).salary := 5000;
    v_employees(2).emp_id := 101; v_employees(2).emp_name := 'Grace'; v_employees(2).salary := 6200;
    v_employees(3).emp_id := 102; v_employees(3).emp_name := 'Linus'; v_employees(3).salary := 4800;

    v_idx := v_employees.FIRST;
    WHILE v_idx IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE(v_employees(v_idx).emp_name || ' (' || v_employees(v_idx).emp_id || '): ' ||
                              v_employees(v_idx).salary);
        v_total := v_total + v_employees(v_idx).salary;
        v_idx := v_employees.NEXT(v_idx);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('total payroll: ' || v_total);
END;
/
