DECLARE
  CURSOR c IS SELECT employee_id, salary FROM employees WHERE salary > 5000;
BEGIN
  FOR r IN c LOOP
    DBMS_OUTPUT.PUT_LINE(r.employee_id || ': ' || r.salary);
  END LOOP;
END;
/
