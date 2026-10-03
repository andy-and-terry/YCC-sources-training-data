-- A compound trigger with per-statement and per-row timing points, useful
-- for batching work that must happen once per statement rather than per row.
CREATE TABLE orders_ct (
    order_id NUMBER,
    amount NUMBER
);

CREATE TABLE order_audit (
    action VARCHAR2(20),
    row_count NUMBER
);

CREATE OR REPLACE TRIGGER orders_ct_audit
FOR INSERT ON orders_ct
COMPOUND TRIGGER
    rows_affected NUMBER := 0;

    BEFORE STATEMENT IS
    BEGIN
        rows_affected := 0;
    END BEFORE STATEMENT;

    AFTER EACH ROW IS
    BEGIN
        rows_affected := rows_affected + 1;
    END AFTER EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        INSERT INTO order_audit VALUES ('INSERT', rows_affected);
    END AFTER STATEMENT;
END orders_ct_audit;
/

INSERT INTO orders_ct VALUES (1, 100);
INSERT INTO orders_ct VALUES (2, 200);

SELECT * FROM order_audit;
