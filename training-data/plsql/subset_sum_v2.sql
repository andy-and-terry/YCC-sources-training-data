CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION subset_sum(nums IN int_table, target IN NUMBER) RETURN NUMBER IS
    TYPE bool_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    dp bool_table;
BEGIN
    FOR s IN 0..target LOOP
        dp(s) := 0;
    END LOOP;
    dp(0) := 1;

    FOR i IN 1..nums.COUNT LOOP
        IF nums(i) <= target THEN
            FOR s IN REVERSE nums(i)..target LOOP
                IF dp(s - nums(i)) = 1 THEN
                    dp(s) := 1;
                END IF;
            END LOOP;
        END IF;
    END LOOP;

    RETURN dp(target);
END subset_sum;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(subset_sum(int_table(3, 34, 4, 12, 5, 2), 9));
    DBMS_OUTPUT.PUT_LINE(subset_sum(int_table(3, 34, 4, 12, 5, 2), 10));
    DBMS_OUTPUT.PUT_LINE(subset_sum(int_table(3, 34, 4, 12, 5, 2), 40));
END;
/
