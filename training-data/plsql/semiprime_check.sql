CREATE OR REPLACE FUNCTION prime_factor_count(p_n IN NUMBER) RETURN NUMBER IS
    v_n     NUMBER := p_n;
    v_p     NUMBER := 2;
    v_count NUMBER := 0;
BEGIN
    WHILE v_p * v_p <= v_n LOOP
        WHILE MOD(v_n, v_p) = 0 LOOP
            v_n := v_n / v_p;
            v_count := v_count + 1;
        END LOOP;
        v_p := v_p + 1;
    END LOOP;
    IF v_n > 1 THEN
        v_count := v_count + 1;
    END IF;
    RETURN v_count;
END prime_factor_count;
/

BEGIN
    FOR n IN 2 .. 29 LOOP
        IF prime_factor_count(n) = 2 THEN
            DBMS_OUTPUT.PUT_LINE(n);
        END IF;
    END LOOP;
END;
/
