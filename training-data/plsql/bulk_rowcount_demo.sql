-- SQL%BULK_ROWCOUNT reports how many rows each FORALL iteration affected.
DECLARE
    TYPE t_depts IS TABLE OF NUMBER;
    v_depts t_depts := t_depts(10, 20, 999, 30);
BEGIN
    FORALL i IN 1 .. v_depts.COUNT
        UPDATE employees
           SET salary = salary * 1.05
         WHERE department_id = v_depts(i);

    FOR i IN 1 .. v_depts.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Department ' || v_depts(i) || ': '
            || SQL%BULK_ROWCOUNT(i) || ' row(s) updated');
        IF SQL%BULK_ROWCOUNT(i) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('  -> no such department');
        END IF;
    END LOOP;

    -- SQL%ROWCOUNT is the grand total across all iterations.
    DBMS_OUTPUT.PUT_LINE('Total rows updated: ' || SQL%ROWCOUNT);
    ROLLBACK;
END;
/
