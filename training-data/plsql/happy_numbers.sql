CREATE OR REPLACE FUNCTION is_happy(p_n IN NUMBER) RETURN NUMBER IS
    v_n NUMBER := p_n;
    v_sum NUMBER;
    v_m NUMBER;
BEGIN
    FOR i IN 1..20 LOOP
        EXIT WHEN v_n = 1;
        v_sum := 0;
        v_m := v_n;
        WHILE v_m > 0 LOOP
            v_sum := v_sum + MOD(v_m, 10) * MOD(v_m, 10);
            v_m := TRUNC(v_m / 10);
        END LOOP;
        v_n := v_sum;
    END LOOP;
    RETURN CASE WHEN v_n = 1 THEN 1 ELSE 0 END;
END is_happy;
/

-- SELECT LEVEL FROM dual WHERE is_happy(LEVEL) = 1 CONNECT BY LEVEL <= 40;
-- 1 7 10 13 19 23 28 31 32 44
