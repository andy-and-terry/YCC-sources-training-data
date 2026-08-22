CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION bubble_sort(arr IN int_table) RETURN int_table IS
    result int_table := arr;
    temp NUMBER;
BEGIN
    FOR i IN 1..result.COUNT - 1 LOOP
        FOR j IN 1..result.COUNT - i LOOP
            IF result(j) > result(j + 1) THEN
                temp := result(j);
                result(j) := result(j + 1);
                result(j + 1) := temp;
            END IF;
        END LOOP;
    END LOOP;
    RETURN result;
END bubble_sort;
/
