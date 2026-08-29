CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION min_coins(coins IN int_table, p_amount IN NUMBER) RETURN NUMBER IS
    TYPE num_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    dp num_table;
BEGIN
    dp(0) := 0;
    FOR n IN 1..p_amount LOOP
        dp(n) := -1;
        FOR c IN 1..coins.COUNT LOOP
            IF coins(c) <= n AND dp(n - coins(c)) != -1 THEN
                IF dp(n) = -1 OR dp(n - coins(c)) + 1 < dp(n) THEN
                    dp(n) := dp(n - coins(c)) + 1;
                END IF;
            END IF;
        END LOOP;
    END LOOP;
    RETURN dp(p_amount);
END min_coins;
/
