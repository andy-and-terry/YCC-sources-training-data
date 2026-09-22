CREATE TABLE inventory_target (
    item_id NUMBER PRIMARY KEY,
    item_name VARCHAR2(50),
    quantity NUMBER
);

CREATE TABLE inventory_staging (
    item_id NUMBER,
    item_name VARCHAR2(50),
    quantity NUMBER
);

INSERT INTO inventory_target VALUES (1, 'Widget', 10);
INSERT INTO inventory_target VALUES (2, 'Gadget', 5);

INSERT INTO inventory_staging VALUES (1, 'Widget', 25);
INSERT INTO inventory_staging VALUES (3, 'Gizmo', 8);

CREATE OR REPLACE PROCEDURE sync_inventory IS
BEGIN
    MERGE INTO inventory_target t
    USING inventory_staging s
    ON (t.item_id = s.item_id)
    WHEN MATCHED THEN
        UPDATE SET t.quantity = s.quantity
    WHEN NOT MATCHED THEN
        INSERT (item_id, item_name, quantity)
        VALUES (s.item_id, s.item_name, s.quantity);
END sync_inventory;
/

BEGIN
    sync_inventory;
    FOR rec IN (SELECT item_id, item_name, quantity FROM inventory_target ORDER BY item_id) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.item_id || ': ' || rec.item_name || ' x' || rec.quantity);
    END LOOP;
END;
/
