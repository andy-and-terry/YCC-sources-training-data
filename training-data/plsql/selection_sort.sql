CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION selection_sort(arr IN int_table) RETURN int_table IS
    result int_table := arr;
    min_idx NUMBER;
    temp NUMBER;
BEGIN
    FOR i IN 1..result.COUNT - 1 LOOP
        min_idx := i;
        FOR j IN i + 1..result.COUNT LOOP
            IF result(j) < result(min_idx) THEN
                min_idx := j;
            END IF;
        END LOOP;
        temp := result(i);
        result(i) := result(min_idx);
        result(min_idx) := temp;
    END LOOP;
    RETURN result;
END selection_sort;
/
