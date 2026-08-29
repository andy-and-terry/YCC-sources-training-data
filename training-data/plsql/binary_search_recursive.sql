CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION binary_search(arr IN int_table, low_idx IN NUMBER, high_idx IN NUMBER, p_target IN NUMBER) RETURN NUMBER IS
    mid NUMBER;
BEGIN
    IF low_idx > high_idx THEN
        RETURN -1;
    END IF;
    mid := TRUNC((low_idx + high_idx) / 2);
    IF arr(mid) = p_target THEN
        RETURN mid;
    ELSIF arr(mid) < p_target THEN
        RETURN binary_search(arr, mid + 1, high_idx, p_target);
    ELSE
        RETURN binary_search(arr, low_idx, mid - 1, p_target);
    END IF;
END binary_search;
/
