CREATE TABLE account_changes (
    acct_id NUMBER PRIMARY KEY,
    balance NUMBER
);

CREATE OR REPLACE TRIGGER account_changes_ct
FOR INSERT OR UPDATE ON account_changes
COMPOUND TRIGGER
    TYPE id_list IS TABLE OF NUMBER;
    touched id_list := id_list();

    BEFORE STATEMENT IS
    BEGIN
        touched.DELETE;
        DBMS_OUTPUT.PUT_LINE('statement starting');
    END BEFORE STATEMENT;

    AFTER EACH ROW IS
    BEGIN
        touched.EXTEND;
        touched(touched.LAST) := :NEW.acct_id;
    END AFTER EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('rows touched: ' || touched.COUNT);
    END AFTER STATEMENT;
END account_changes_ct;
/

BEGIN
    INSERT INTO account_changes VALUES (1, 100);
    INSERT INTO account_changes VALUES (2, 200);
    UPDATE account_changes SET balance = balance + 10;
END;
/
