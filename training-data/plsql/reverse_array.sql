CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION reverse_array(arr IN int_table) RETURN int_table IS
    result int_table := int_table();
BEGIN
    result.EXTEND(arr.COUNT);
    FOR i IN 1..arr.COUNT LOOP
        result(i) := arr(arr.COUNT - i + 1);
    END LOOP;
    RETURN result;
END reverse_array;
/
