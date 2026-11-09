DECLARE
  TYPE t_ids IS TABLE OF NUMBER;
  v_ids t_ids;
BEGIN
  SELECT employee_id BULK COLLECT INTO v_ids FROM employees WHERE ROWNUM <= 100;
  FORALL i IN 1 .. v_ids.COUNT
    UPDATE employees SET salary = salary * 1.05 WHERE employee_id = v_ids(i);
  COMMIT;
END;
/
