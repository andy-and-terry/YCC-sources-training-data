CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION subset_sum(p_nums IN int_table, p_target IN NUMBER) RETURN VARCHAR2 IS
    TYPE bool_table IS TABLE OF BOOLEAN INDEX BY PLS_INTEGER;
    dp bool_table;
BEGIN
    dp(0) := TRUE;
    FOR s IN 1..p_target LOOP
        dp(s) := FALSE;
    END LOOP;
    FOR i IN 1..p_nums.COUNT LOOP
        FOR s IN REVERSE p_nums(i)..p_target LOOP
            IF dp(s - p_nums(i)) THEN
                dp(s) := TRUE;
            END IF;
        END LOOP;
    END LOOP;
    IF dp(p_target) THEN
        RETURN 'TRUE';
    ELSE
        RETURN 'FALSE';
    END IF;
END subset_sum;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(subset_sum(int_table(3, 34, 4, 12, 5, 2), 9));
    DBMS_OUTPUT.PUT_LINE(subset_sum(int_table(3, 34, 4, 12, 5, 2), 21));
    DBMS_OUTPUT.PUT_LINE(subset_sum(int_table(3, 34, 4, 12, 5, 2), 100));
END;
/
