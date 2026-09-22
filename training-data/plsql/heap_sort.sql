CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE PROCEDURE sift_down(arr IN OUT NOCOPY int_table, p_root IN NUMBER, p_end IN NUMBER) IS
    root NUMBER := p_root;
    child NUMBER;
    tmp NUMBER;
BEGIN
    LOOP
        child := 2 * root;
        EXIT WHEN child > p_end;
        IF child + 1 <= p_end AND arr(child) < arr(child + 1) THEN
            child := child + 1;
        END IF;
        IF arr(root) < arr(child) THEN
            tmp := arr(root);
            arr(root) := arr(child);
            arr(child) := tmp;
            root := child;
        ELSE
            EXIT;
        END IF;
    END LOOP;
END sift_down;
/

CREATE OR REPLACE FUNCTION heap_sort(p_arr IN int_table) RETURN int_table IS
    arr int_table := p_arr;
    n NUMBER := p_arr.COUNT;
    tmp NUMBER;
BEGIN
    FOR i IN REVERSE 1..TRUNC(n / 2) LOOP
        sift_down(arr, i, n);
    END LOOP;
    FOR end_pos IN REVERSE 2..n LOOP
        tmp := arr(1);
        arr(1) := arr(end_pos);
        arr(end_pos) := tmp;
        sift_down(arr, 1, end_pos - 1);
    END LOOP;
    RETURN arr;
END heap_sort;
/

DECLARE
    sorted int_table;
    out_str VARCHAR2(200) := '';
BEGIN
    sorted := heap_sort(int_table(12, 11, 13, 5, 6, 7));
    FOR i IN 1..sorted.COUNT LOOP
        out_str := out_str || sorted(i);
        IF i < sorted.COUNT THEN
            out_str := out_str || ',';
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(out_str);
END;
/
