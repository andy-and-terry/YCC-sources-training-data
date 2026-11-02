DECLARE
  TYPE id_tab IS TABLE OF employees.employee_id%TYPE;
  ids id_tab;
BEGIN
  SELECT employee_id BULK COLLECT INTO ids FROM employees WHERE department_id = 10;
  FORALL i IN 1 .. ids.COUNT
    UPDATE employees SET salary = salary * 1.05 WHERE employee_id = ids(i);
  COMMIT;
END;
/
