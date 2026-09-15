CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION sliding_window_max(arr IN int_table, k IN NUMBER) RETURN int_table IS
    TYPE deque_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    deque deque_table;
    front_idx PLS_INTEGER := 1;
    back_idx PLS_INTEGER := 0;
    result int_table := int_table();
BEGIN
    FOR i IN 1..arr.COUNT LOOP
        WHILE back_idx >= front_idx AND arr(deque(back_idx)) < arr(i) LOOP
            deque.DELETE(back_idx);
            back_idx := back_idx - 1;
        END LOOP;
        back_idx := back_idx + 1;
        deque(back_idx) := i;

        IF deque(front_idx) <= i - k THEN
            deque.DELETE(front_idx);
            front_idx := front_idx + 1;
        END IF;

        IF i >= k THEN
            result.EXTEND;
            result(result.COUNT) := arr(deque(front_idx));
        END IF;
    END LOOP;
    RETURN result;
END sliding_window_max;
/

DECLARE
    nums int_table := int_table(1, 3, -1, -3, 5, 3, 6, 7);
    res int_table;
BEGIN
    res := sliding_window_max(nums, 3);
    FOR i IN 1..res.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(res(i));
    END LOOP;
END;
/
