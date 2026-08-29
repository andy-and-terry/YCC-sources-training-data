CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION kadane(arr IN int_table) RETURN NUMBER IS
    best NUMBER := arr(1);
    current_val NUMBER := arr(1);
BEGIN
    FOR i IN 2..arr.COUNT LOOP
        IF arr(i) > current_val + arr(i) THEN
            current_val := arr(i);
        ELSE
            current_val := current_val + arr(i);
        END IF;
        IF current_val > best THEN
            best := current_val;
        END IF;
    END LOOP;
    RETURN best;
END kadane;
/
