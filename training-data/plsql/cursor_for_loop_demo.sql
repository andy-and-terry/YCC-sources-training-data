DECLARE
  CURSOR c IS SELECT employee_id, last_name FROM employees WHERE department_id = 50;
BEGIN
  FOR r IN c LOOP
    DBMS_OUTPUT.PUT_LINE(r.employee_id || ' ' || r.last_name);
  END LOOP;
END;
/
