CREATE OR REPLACE FUNCTION longest_common_subsequence(p_a IN VARCHAR2, p_b IN VARCHAR2) RETURN NUMBER IS
    TYPE num_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE table_2d IS TABLE OF num_table INDEX BY PLS_INTEGER;
    dp table_2d;
    m NUMBER := LENGTH(p_a);
    n NUMBER := LENGTH(p_b);
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
            ELSIF dp(i - 1)(j) >= dp(i)(j - 1) THEN
                dp(i)(j) := dp(i - 1)(j);
            ELSE
                dp(i)(j) := dp(i)(j - 1);
            END IF;
        END LOOP;
    END LOOP;
    RETURN dp(m)(n);
END longest_common_subsequence;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(longest_common_subsequence('ABCBDAB', 'BDCABA'));
END;
/
