-- FOR UPDATE locks the rows a cursor selects, and WHERE CURRENT OF then
-- targets exactly the row the cursor is positioned on, with no separate
-- WHERE clause or primary key lookup needed.
CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    owner_name VARCHAR2(30),
    balance    NUMBER
);

INSERT INTO accounts VALUES (1, 'Ada', 100);
INSERT INTO accounts VALUES (2, 'Bob', 250);
INSERT INTO accounts VALUES (3, 'Cleo', 40);

DECLARE
    CURSOR low_balance_cursor IS
        SELECT account_id, balance
        FROM accounts
        WHERE balance < 100
        FOR UPDATE OF balance;
BEGIN
    FOR rec IN low_balance_cursor LOOP
        UPDATE accounts
        SET balance = balance + 25
        WHERE CURRENT OF low_balance_cursor;
        DBMS_OUTPUT.PUT_LINE('topped up account ' || rec.account_id);
    END LOOP;
    COMMIT;
END;
/
