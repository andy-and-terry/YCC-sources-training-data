CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION is_safe(queens IN int_table, p_col IN NUMBER) RETURN NUMBER IS
    dist NUMBER;
BEGIN
    FOR i IN 1..queens.COUNT LOOP
        dist := queens.COUNT - i + 1;
        IF queens(i) = p_col OR ABS(queens(i) - p_col) = dist THEN
            RETURN 0;
        END IF;
    END LOOP;
    RETURN 1;
END is_safe;
/

CREATE OR REPLACE FUNCTION solve_n_queens(queens IN int_table, p_n IN NUMBER) RETURN NUMBER IS
    count_val NUMBER := 0;
    new_queens int_table;
BEGIN
    IF queens.COUNT = p_n THEN
        RETURN 1;
    END IF;
    FOR col IN 0..p_n - 1 LOOP
        IF is_safe(queens, col) = 1 THEN
            new_queens := queens;
            new_queens.EXTEND;
            new_queens(new_queens.COUNT) := col;
            count_val := count_val + solve_n_queens(new_queens, p_n);
        END IF;
    END LOOP;
    RETURN count_val;
END solve_n_queens;
/
