CREATE TABLE ct_orders (
    id     NUMBER PRIMARY KEY,
    amount NUMBER
);

CREATE OR REPLACE TRIGGER ct_orders_audit
FOR INSERT OR UPDATE ON ct_orders
COMPOUND TRIGGER
    TYPE id_list IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    g_ids id_list;

    AFTER EACH ROW IS
    BEGIN
        g_ids(g_ids.COUNT + 1) := :NEW.id;
    END AFTER EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Rows changed in statement: ' || g_ids.COUNT);
    END AFTER STATEMENT;
END ct_orders_audit;
/
