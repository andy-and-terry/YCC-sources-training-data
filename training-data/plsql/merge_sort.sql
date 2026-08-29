CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION merge_arrays(left_arr IN int_table, right_arr IN int_table) RETURN int_table IS
    result int_table := int_table();
    i NUMBER := 1;
    j NUMBER := 1;
BEGIN
    WHILE i <= left_arr.COUNT AND j <= right_arr.COUNT LOOP
        result.EXTEND;
        IF left_arr(i) <= right_arr(j) THEN
            result(result.COUNT) := left_arr(i);
            i := i + 1;
        ELSE
            result(result.COUNT) := right_arr(j);
            j := j + 1;
        END IF;
    END LOOP;
    WHILE i <= left_arr.COUNT LOOP
        result.EXTEND;
        result(result.COUNT) := left_arr(i);
        i := i + 1;
    END LOOP;
    WHILE j <= right_arr.COUNT LOOP
        result.EXTEND;
        result(result.COUNT) := right_arr(j);
        j := j + 1;
    END LOOP;
    RETURN result;
END merge_arrays;
/

CREATE OR REPLACE FUNCTION merge_sort(arr IN int_table) RETURN int_table IS
    mid NUMBER;
    left_arr int_table := int_table();
    right_arr int_table := int_table();
BEGIN
    IF arr.COUNT <= 1 THEN
        RETURN arr;
    END IF;
    mid := TRUNC(arr.COUNT / 2);
    FOR i IN 1..mid LOOP
        left_arr.EXTEND;
        left_arr(i) := arr(i);
    END LOOP;
    FOR i IN mid + 1..arr.COUNT LOOP
        right_arr.EXTEND;
        right_arr(right_arr.COUNT) := arr(i);
    END LOOP;
    RETURN merge_arrays(merge_sort(left_arr), merge_sort(right_arr));
END merge_sort;
/
