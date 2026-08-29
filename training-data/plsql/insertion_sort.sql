CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION insertion_sort(arr IN int_table) RETURN int_table IS
    result int_table := arr;
    key_val NUMBER;
    j NUMBER;
BEGIN
    FOR i IN 2..result.COUNT LOOP
        key_val := result(i);
        j := i - 1;
        WHILE j >= 1 AND result(j) > key_val LOOP
            result(j + 1) := result(j);
            j := j - 1;
        END LOOP;
        result(j + 1) := key_val;
    END LOOP;
    RETURN result;
END insertion_sort;
/
