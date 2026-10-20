CREATE TABLE audit_log (id NUMBER GENERATED ALWAYS AS IDENTITY, msg VARCHAR2(100), at TIMESTAMP DEFAULT SYSTIMESTAMP);
CREATE TABLE accounts (id NUMBER PRIMARY KEY, balance NUMBER);
/
CREATE OR REPLACE PROCEDURE log_msg(p_msg VARCHAR2) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    INSERT INTO audit_log(msg) VALUES (p_msg);
    COMMIT;
END;
/
CREATE OR REPLACE TRIGGER trg_accounts_audit
BEFORE UPDATE OF balance ON accounts
FOR EACH ROW
WHEN (NEW.balance < 0)
BEGIN
    log_msg('negative balance for ' || :OLD.id || ': ' || :NEW.balance);
    RAISE_APPLICATION_ERROR(-20010, 'balance cannot be negative');
END;
/
INSERT INTO accounts VALUES (1, 100);
UPDATE accounts SET balance = balance - 30 WHERE id = 1;
