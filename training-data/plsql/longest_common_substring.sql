-- Longest common SUBSTRING (contiguous), unlike longest_common_subsequence.sql
-- which allows gaps. The DP resets to 0 on a mismatch instead of taking the
-- max of the two neighbors, and the best length/end position are tracked
-- so the actual substring can be sliced out at the end.
CREATE OR REPLACE FUNCTION longest_common_substring(p_a IN VARCHAR2, p_b IN VARCHAR2) RETURN VARCHAR2 IS
    TYPE num_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE table_2d IS TABLE OF num_table INDEX BY PLS_INTEGER;
    dp table_2d;
    m NUMBER := LENGTH(p_a);
    n NUMBER := LENGTH(p_b);
    best_len NUMBER := 0;
    best_end NUMBER := 0;
BEGIN
    FOR i IN 0..m LOOP
        dp(i)(0) := 0;
    END LOOP;
    FOR j IN 0..n LOOP
        dp(0)(j) := 0;
    END LOOP;
    FOR i IN 1..m LOOP
        FOR j IN 1..n LOOP
            IF SUBSTR(p_a, i, 1) = SUBSTR(p_b, j, 1) THEN
                dp(i)(j) := dp(i - 1)(j - 1) + 1;
                IF dp(i)(j) > best_len THEN
                    best_len := dp(i)(j);
                    best_end := i;
                END IF;
            ELSE
                dp(i)(j) := 0;
            END IF;
        END LOOP;
    END LOOP;
    IF best_len = 0 THEN
        RETURN NULL;
    END IF;
    RETURN SUBSTR(p_a, best_end - best_len + 1, best_len);
END longest_common_substring;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(longest_common_substring('ABABC', 'BABCA'));
END;
/
