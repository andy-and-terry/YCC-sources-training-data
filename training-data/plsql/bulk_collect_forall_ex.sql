DECLARE
  TYPE t_ids IS TABLE OF employees.employee_id%TYPE;
  ids t_ids;
BEGIN
  SELECT employee_id BULK COLLECT INTO ids FROM employees WHERE salary < 3000;
  FORALL i IN 1 .. ids.COUNT
    UPDATE employees SET salary = salary * 1.05 WHERE employee_id = ids(i);
  DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows updated');
END;
/
