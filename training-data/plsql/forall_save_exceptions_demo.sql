-- FORALL ... SAVE EXCEPTIONS lets a bulk DML statement keep going past a
-- failing row instead of aborting on the first one, then reports every
-- failure afterwards through SQL%BULK_EXCEPTIONS.
CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    balance NUMBER NOT NULL CHECK (balance >= 0)
);

INSERT INTO accounts VALUES (1, 100);
INSERT INTO accounts VALUES (2, 200);
INSERT INTO accounts VALUES (3, 300);

DECLARE
    TYPE id_table IS TABLE OF NUMBER;
    TYPE delta_table IS TABLE OF NUMBER;

    ids id_table := id_table(1, 2, 3);
    deltas delta_table := delta_table(10, -500, 30);

    bulk_errors EXCEPTION;
    PRAGMA EXCEPTION_INIT(bulk_errors, -24381);
BEGIN
    FORALL i IN ids.FIRST..ids.LAST SAVE EXCEPTIONS
        UPDATE accounts SET balance = balance + deltas(i) WHERE account_id = ids(i);

    DBMS_OUTPUT.PUT_LINE('all updates succeeded');
EXCEPTION
    WHEN bulk_errors THEN
        DBMS_OUTPUT.PUT_LINE(SQL%BULK_EXCEPTIONS.COUNT || ' error(s) out of ' || ids.COUNT || ' rows');
        FOR i IN 1..SQL%BULK_EXCEPTIONS.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(
                'row ' || SQL%BULK_EXCEPTIONS(i).ERROR_INDEX ||
                ': ' || SQLERRM(-SQL%BULK_EXCEPTIONS(i).ERROR_CODE)
            );
        END LOOP;
END;
/

SELECT account_id, balance FROM accounts ORDER BY account_id;
