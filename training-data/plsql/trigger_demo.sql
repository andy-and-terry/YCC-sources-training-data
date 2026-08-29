CREATE TABLE audit_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY,
    action VARCHAR2(50),
    log_time TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    salary NUMBER
);

CREATE OR REPLACE TRIGGER employees_salary_audit
AFTER UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action)
    VALUES ('Salary changed from ' || :OLD.salary || ' to ' || :NEW.salary);
END employees_salary_audit;
/
