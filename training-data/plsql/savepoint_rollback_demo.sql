CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    balance NUMBER
);

INSERT INTO accounts VALUES (1, 100);
INSERT INTO accounts VALUES (2, 50);
COMMIT;

CREATE OR REPLACE PROCEDURE transfer_with_rollback(
    p_from IN NUMBER,
    p_to IN NUMBER,
    p_amount IN NUMBER
) IS
    v_from_balance NUMBER;
BEGIN
    SAVEPOINT before_transfer;

    SELECT balance INTO v_from_balance FROM accounts WHERE account_id = p_from;
    IF v_from_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds');
    END IF;

    UPDATE accounts SET balance = balance - p_amount WHERE account_id = p_from;
    UPDATE accounts SET balance = balance + p_amount WHERE account_id = p_to;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK TO before_transfer;
        DBMS_OUTPUT.PUT_LINE('Transfer failed: ' || SQLERRM);
END transfer_with_rollback;
/

BEGIN
    transfer_with_rollback(1, 2, 30);
    transfer_with_rollback(1, 2, 1000);

    FOR rec IN (SELECT account_id, balance FROM accounts ORDER BY account_id) LOOP
        DBMS_OUTPUT.PUT_LINE('account ' || rec.account_id || ': ' || rec.balance);
    END LOOP;
END;
/
