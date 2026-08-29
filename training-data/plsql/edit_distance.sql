CREATE OR REPLACE FUNCTION edit_distance(p_a IN VARCHAR2, p_b IN VARCHAR2) RETURN NUMBER IS
    TYPE num_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE table_2d IS TABLE OF num_table INDEX BY PLS_INTEGER;
    dp table_2d;
    m NUMBER := LENGTH(p_a);
    n NUMBER := LENGTH(p_b);
    cost NUMBER;
    min_val NUMBER;
BEGIN
    FOR i IN 0..m LOOP
        dp(i)(0) := i;
    END LOOP;
    FOR j IN 0..n LOOP
        dp(0)(j) := j;
    END LOOP;
    FOR i IN 1..m LOOP
        FOR j IN 1..n LOOP
            IF SUBSTR(p_a, i, 1) = SUBSTR(p_b, j, 1) THEN
                cost := 0;
            ELSE
                cost := 1;
            END IF;
            min_val := dp(i - 1)(j) + 1;
            IF dp(i)(j - 1) + 1 < min_val THEN
                min_val := dp(i)(j - 1) + 1;
            END IF;
            IF dp(i - 1)(j - 1) + cost < min_val THEN
                min_val := dp(i - 1)(j - 1) + cost;
            END IF;
            dp(i)(j) := min_val;
        END LOOP;
    END LOOP;
    RETURN dp(m)(n);
END edit_distance;
/
