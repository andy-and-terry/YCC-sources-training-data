CREATE OR REPLACE FUNCTION longest_pal_subseq(p_str IN VARCHAR2) RETURN NUMBER IS
    n NUMBER := LENGTH(p_str);
    TYPE num_matrix IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
    dp num_matrix;
BEGIN
    IF n = 0 THEN
        RETURN 0;
    END IF;
    FOR i IN 1..n LOOP
        dp(i || '_' || i) := 1;
    END LOOP;
    FOR len IN 2..n LOOP
        FOR i IN 1..n - len + 1 LOOP
            DECLARE
                j NUMBER := i + len - 1;
                inner_val NUMBER;
            BEGIN
                IF SUBSTR(p_str, i, 1) = SUBSTR(p_str, j, 1) THEN
                    IF i + 1 <= j - 1 THEN
                        inner_val := dp((i + 1) || '_' || (j - 1));
                    ELSE
                        inner_val := 0;
                    END IF;
                    dp(i || '_' || j) := inner_val + 2;
                ELSE
                    dp(i || '_' || j) := GREATEST(dp((i + 1) || '_' || j), dp(i || '_' || (j - 1)));
                END IF;
            END;
        END LOOP;
    END LOOP;
    RETURN dp('1_' || n);
END longest_pal_subseq;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(longest_pal_subseq('bbbab'));
    DBMS_OUTPUT.PUT_LINE(longest_pal_subseq('cbbd'));
END;
/
