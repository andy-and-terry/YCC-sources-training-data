-- Matrix chain multiplication: p_dims has n+1 entries where matrix i has
-- dimensions p_dims(i) x p_dims(i+1). dp, keyed by i*100+j (n is small
-- enough that this never collides), holds the minimum scalar
-- multiplications needed to multiply matrices i..j.
CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION matrix_chain_order(p_dims IN int_table) RETURN NUMBER IS
    TYPE num_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    dp num_table;
    n PLS_INTEGER;
    j PLS_INTEGER;
    cost NUMBER;
    c_infinity CONSTANT NUMBER := 1000000000;
BEGIN
    n := p_dims.COUNT - 1;
    FOR i IN 1..n LOOP
        dp(i * 100 + i) := 0;
    END LOOP;

    FOR len IN 2..n LOOP
        FOR i IN 1..(n - len + 1) LOOP
            j := i + len - 1;
            dp(i * 100 + j) := c_infinity;
            FOR k IN i..j - 1 LOOP
                cost := dp(i * 100 + k) + dp((k + 1) * 100 + j) + p_dims(i) * p_dims(k + 1) * p_dims(j + 1);
                IF cost < dp(i * 100 + j) THEN
                    dp(i * 100 + j) := cost;
                END IF;
            END LOOP;
        END LOOP;
    END LOOP;

    RETURN dp(1 * 100 + n);
END matrix_chain_order;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(matrix_chain_order(int_table(40, 20, 30, 10, 30)));
    DBMS_OUTPUT.PUT_LINE(matrix_chain_order(int_table(10, 20, 30)));
END;
/
