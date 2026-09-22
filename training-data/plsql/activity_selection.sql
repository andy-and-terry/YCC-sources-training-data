CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION activity_selection(starts IN int_table, ends IN int_table) RETURN int_table IS
    n NUMBER := starts.COUNT;
    order_idx int_table := int_table();
    selected int_table := int_table();
    last_end NUMBER := -1;
    temp NUMBER;
BEGIN
    order_idx.EXTEND(n);
    FOR i IN 1..n LOOP
        order_idx(i) := i;
    END LOOP;

    FOR i IN 1..n - 1 LOOP
        FOR j IN 1..n - i LOOP
            IF ends(order_idx(j)) > ends(order_idx(j + 1)) THEN
                temp := order_idx(j);
                order_idx(j) := order_idx(j + 1);
                order_idx(j + 1) := temp;
            END IF;
        END LOOP;
    END LOOP;

    FOR i IN 1..n LOOP
        IF starts(order_idx(i)) >= last_end THEN
            selected.EXTEND;
            selected(selected.COUNT) := order_idx(i);
            last_end := ends(order_idx(i));
        END IF;
    END LOOP;

    RETURN selected;
END activity_selection;
/

DECLARE
    starts int_table := int_table(1, 3, 0, 5, 8, 5);
    ends int_table := int_table(2, 4, 6, 7, 9, 9);
    chosen int_table;
BEGIN
    chosen := activity_selection(starts, ends);
    FOR i IN 1..chosen.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('activity ' || chosen(i));
    END LOOP;
END;
/
