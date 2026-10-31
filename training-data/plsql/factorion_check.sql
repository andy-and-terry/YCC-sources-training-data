CREATE OR REPLACE FUNCTION is_factorion(p_n IN NUMBER) RETURN NUMBER IS
    TYPE t_fact IS VARRAY(10) OF NUMBER;
    v_fact t_fact := t_fact(1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880);
    v_m    NUMBER := p_n;
    v_sum  NUMBER := 0;
BEGIN
    WHILE v_m > 0 LOOP
        v_sum := v_sum + v_fact(MOD(v_m, 10) + 1);
        v_m := TRUNC(v_m / 10);
    END LOOP;
    RETURN CASE WHEN v_sum = p_n THEN 1 ELSE 0 END;
END is_factorion;
/

SELECT LEVEL AS n FROM dual CONNECT BY LEVEL < 50000
WHERE is_factorion(LEVEL) = 1;
