CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION rod_cutting(p_prices IN int_table, p_length IN NUMBER) RETURN NUMBER IS
    TYPE num_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    dp num_table;
BEGIN
    dp(0) := 0;
    FOR i IN 1..p_length LOOP
        dp(i) := 0;
        FOR cut IN 1..i LOOP
            IF p_prices(cut) + dp(i - cut) > dp(i) THEN
                dp(i) := p_prices(cut) + dp(i - cut);
            END IF;
        END LOOP;
    END LOOP;
    RETURN dp(p_length);
END rod_cutting;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(rod_cutting(int_table(1, 5, 8, 9, 10, 17, 17, 20), 8));
    DBMS_OUTPUT.PUT_LINE(rod_cutting(int_table(1, 5, 8, 9, 10, 17, 17, 20), 4));
END;
/
