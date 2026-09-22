-- Binary min-heap as package-level state (a 1-indexed nested table).
CREATE OR REPLACE PACKAGE binary_heap_pkg IS
    PROCEDURE reset_heap;
    PROCEDURE push_value(p_value IN NUMBER);
    FUNCTION pop_value RETURN NUMBER;
    FUNCTION heap_size RETURN NUMBER;
END binary_heap_pkg;
/

CREATE OR REPLACE PACKAGE BODY binary_heap_pkg IS
    TYPE num_table IS TABLE OF NUMBER;
    data num_table := num_table();

    PROCEDURE reset_heap IS
    BEGIN
        data := num_table();
    END reset_heap;

    PROCEDURE push_value(p_value IN NUMBER) IS
        i NUMBER;
        parent NUMBER;
        tmp NUMBER;
    BEGIN
        data.EXTEND;
        data(data.COUNT) := p_value;
        i := data.COUNT;
        WHILE i > 1 LOOP
            parent := TRUNC(i / 2);
            EXIT WHEN data(parent) <= data(i);
            tmp := data(parent);
            data(parent) := data(i);
            data(i) := tmp;
            i := parent;
        END LOOP;
    END push_value;

    FUNCTION pop_value RETURN NUMBER IS
        top_val NUMBER;
        i NUMBER;
        left_child NUMBER;
        right_child NUMBER;
        smallest NUMBER;
        tmp NUMBER;
    BEGIN
        top_val := data(1);
        data(1) := data(data.COUNT);
        data.TRIM;
        i := 1;
        LOOP
            left_child := 2 * i;
            right_child := 2 * i + 1;
            smallest := i;
            IF left_child <= data.COUNT AND data(left_child) < data(smallest) THEN
                smallest := left_child;
            END IF;
            IF right_child <= data.COUNT AND data(right_child) < data(smallest) THEN
                smallest := right_child;
            END IF;
            EXIT WHEN smallest = i;
            tmp := data(smallest);
            data(smallest) := data(i);
            data(i) := tmp;
            i := smallest;
        END LOOP;
        RETURN top_val;
    END pop_value;

    FUNCTION heap_size RETURN NUMBER IS
    BEGIN
        RETURN data.COUNT;
    END heap_size;
END binary_heap_pkg;
/

DECLARE
    out_str VARCHAR2(200) := '';
    total NUMBER;
    i NUMBER := 0;
BEGIN
    binary_heap_pkg.reset_heap;
    binary_heap_pkg.push_value(5);
    binary_heap_pkg.push_value(3);
    binary_heap_pkg.push_value(8);
    binary_heap_pkg.push_value(1);
    binary_heap_pkg.push_value(9);
    binary_heap_pkg.push_value(2);
    total := binary_heap_pkg.heap_size;
    WHILE binary_heap_pkg.heap_size > 0 LOOP
        i := i + 1;
        out_str := out_str || binary_heap_pkg.pop_value;
        IF i < total THEN
            out_str := out_str || ',';
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(out_str);
END;
/
