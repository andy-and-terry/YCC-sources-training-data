CREATE OR REPLACE TYPE sorted_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION binary_search(arr IN sorted_table, target IN NUMBER) RETURN NUMBER IS
    low NUMBER := arr.FIRST;
    high NUMBER := arr.LAST;
    mid NUMBER;
BEGIN
    WHILE low <= high LOOP
        mid := TRUNC((low + high) / 2);
        IF arr(mid) = target THEN
            RETURN mid;
        ELSIF arr(mid) < target THEN
            low := mid + 1;
        ELSE
            high := mid - 1;
        END IF;
    END LOOP;
    RETURN -1;
END binary_search;
/
