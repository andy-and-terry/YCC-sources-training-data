-- A COMPOUND TRIGGER combines the statement- and row-level timing points
-- of one DML event into a single trigger body, letting them share
-- package-like state without needing a real package (useful for
-- bulk-friendly validation and aggregation).
CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    balance    NUMBER
);

INSERT INTO accounts VALUES (1, 100);
INSERT INTO accounts VALUES (2, 250);
INSERT INTO accounts VALUES (3, 75);

CREATE TABLE accounts_audit (
    audit_id       NUMBER GENERATED ALWAYS AS IDENTITY,
    rows_changed   NUMBER,
    total_delta    NUMBER,
    logged_at      TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE OR REPLACE TRIGGER accounts_balance_compound
FOR UPDATE OF balance ON accounts
COMPOUND TRIGGER

    v_rows_changed NUMBER := 0;
    v_total_delta  NUMBER := 0;

    BEFORE STATEMENT IS
    BEGIN
        v_rows_changed := 0;
        v_total_delta := 0;
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS
    BEGIN
        IF :NEW.balance < 0 THEN
            RAISE_APPLICATION_ERROR(-20010, 'balance cannot go negative');
        END IF;
    END BEFORE EACH ROW;

    AFTER EACH ROW IS
    BEGIN
        v_rows_changed := v_rows_changed + 1;
        v_total_delta := v_total_delta + (:NEW.balance - :OLD.balance);
    END AFTER EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        INSERT INTO accounts_audit (rows_changed, total_delta)
        VALUES (v_rows_changed, v_total_delta);
    END AFTER STATEMENT;

END accounts_balance_compound;
/

UPDATE accounts SET balance = balance + 10 WHERE account_id IN (1, 2);

BEGIN
    FOR rec IN (SELECT rows_changed, total_delta FROM accounts_audit ORDER BY audit_id) LOOP
        DBMS_OUTPUT.PUT_LINE('rows: ' || rec.rows_changed || ', delta: ' || rec.total_delta);
    END LOOP;
END;
/
