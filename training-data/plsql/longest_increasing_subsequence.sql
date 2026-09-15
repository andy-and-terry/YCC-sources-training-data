CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION longest_increasing_subsequence(p_arr IN int_table) RETURN NUMBER IS
    TYPE num_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    dp num_table;
    best NUMBER := 0;
BEGIN
    FOR i IN 1..p_arr.COUNT LOOP
        dp(i) := 1;
        FOR j IN 1..i - 1 LOOP
            IF p_arr(j) < p_arr(i) AND dp(j) + 1 > dp(i) THEN
                dp(i) := dp(j) + 1;
            END IF;
        END LOOP;
        IF dp(i) > best THEN
            best := dp(i);
        END IF;
    END LOOP;
    RETURN best;
END longest_increasing_subsequence;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(longest_increasing_subsequence(int_table(10, 9, 2, 5, 3, 7, 101, 18)));
END;
/
