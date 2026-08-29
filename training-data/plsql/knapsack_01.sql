CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION knapsack(weights IN int_table, values IN int_table, capacity IN NUMBER) RETURN NUMBER IS
    TYPE num_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    dp num_table;
BEGIN
    FOR c IN 0..capacity LOOP
        dp(c) := 0;
    END LOOP;
    FOR i IN 1..weights.COUNT LOOP
        FOR cap IN REVERSE weights(i)..capacity LOOP
            IF dp(cap - weights(i)) + values(i) > dp(cap) THEN
                dp(cap) := dp(cap - weights(i)) + values(i);
            END IF;
        END LOOP;
    END LOOP;
    RETURN dp(capacity);
END knapsack;
/
