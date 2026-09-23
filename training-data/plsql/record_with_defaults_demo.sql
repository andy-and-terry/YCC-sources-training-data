-- Record fields can anchor to a column with %TYPE and carry their own
-- NOT NULL DEFAULT, independent of the table's own constraints.
CREATE TABLE inventory_items (
    item_id     NUMBER PRIMARY KEY,
    item_name   VARCHAR2(40),
    qty_on_hand NUMBER
);

DECLARE
    TYPE item_rec IS RECORD (
        item_id     inventory_items.item_id%TYPE,
        item_name   inventory_items.item_name%TYPE,
        qty_on_hand inventory_items.qty_on_hand%TYPE NOT NULL := 0,
        is_active   BOOLEAN NOT NULL := TRUE
    );
    v_item  item_rec;
    v_blank NUMBER; -- an uninitialized NUMBER variable defaults to NULL
BEGIN
    -- fields with a NOT NULL DEFAULT are pre-populated without assignment
    DBMS_OUTPUT.PUT_LINE('default qty_on_hand: ' || v_item.qty_on_hand);
    DBMS_OUTPUT.PUT_LINE('default is_active: ' || CASE WHEN v_item.is_active THEN 'TRUE' ELSE 'FALSE' END);

    v_item.item_id     := 1;
    v_item.item_name   := 'Widget';
    v_item.qty_on_hand := 150;
    DBMS_OUTPUT.PUT_LINE(v_item.item_name || ': ' || v_item.qty_on_hand || ' on hand');

    BEGIN
        v_item.qty_on_hand := v_blank;
    EXCEPTION
        WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('cannot assign NULL into a NOT NULL record field: ' || SQLERRM);
    END;
END;
/
