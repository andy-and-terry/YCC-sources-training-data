CREATE OR REPLACE TRIGGER trg_emp_audit
BEFORE UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
  INSERT INTO salary_audit (emp_id, old_sal, new_sal, changed_at)
  VALUES (:OLD.employee_id, :OLD.salary, :NEW.salary, SYSDATE);
END;
/
