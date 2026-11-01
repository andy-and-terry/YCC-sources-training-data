CREATE OR REPLACE TRIGGER trg_salary_audit
  BEFORE UPDATE OF salary ON employees
  FOR EACH ROW
  WHEN (NEW.salary <> OLD.salary)
BEGIN
  INSERT INTO salary_audit (emp_id, old_sal, new_sal, changed_at)
  VALUES (:OLD.employee_id, :OLD.salary, :NEW.salary, SYSDATE);
END;
/
