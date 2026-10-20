DECLARE
  TYPE t_ids IS TABLE OF employees.employee_id%TYPE;
  v_ids t_ids;
BEGIN
  SELECT employee_id BULK COLLECT INTO v_ids FROM employees WHERE ROWNUM <= 5;
  FORALL i IN 1 .. v_ids.COUNT
    UPDATE employees SET salary = salary * 1.1 WHERE employee_id = v_ids(i);
  DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;
/
