CREATE OR REPLACE FUNCTION persistence(p_n IN NUMBER) RETURN NUMBER IS
    v_n       NUMBER := p_n;
    v_steps   NUMBER := 0;
    v_product NUMBER;
BEGIN
    WHILE v_n >= 10 LOOP
        v_product := 1;
        WHILE v_n > 0 LOOP
            v_product := v_product * MOD(v_n, 10);
            v_n := TRUNC(v_n / 10);
        END LOOP;
        v_n := v_product;
        v_steps := v_steps + 1;
    END LOOP;
    RETURN v_steps;
END persistence;
/

SELECT n, persistence(n) AS steps FROM (
    SELECT 39 AS n FROM dual UNION ALL SELECT 77 FROM dual
    UNION ALL SELECT 999 FROM dual UNION ALL SELECT 10 FROM dual
);
