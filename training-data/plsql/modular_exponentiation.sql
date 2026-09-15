CREATE OR REPLACE FUNCTION mod_pow(p_base IN NUMBER, p_exp IN NUMBER, p_mod IN NUMBER) RETURN NUMBER IS
    result_val NUMBER := 1;
    base_val NUMBER := MOD(p_base, p_mod);
    exp_val NUMBER := p_exp;
BEGIN
    WHILE exp_val > 0 LOOP
        IF MOD(exp_val, 2) = 1 THEN
            result_val := MOD(result_val * base_val, p_mod);
        END IF;
        exp_val := TRUNC(exp_val / 2);
        base_val := MOD(base_val * base_val, p_mod);
    END LOOP;
    RETURN result_val;
END mod_pow;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(mod_pow(2, 10, 1000));
    DBMS_OUTPUT.PUT_LINE(mod_pow(3, 200, 50));
    DBMS_OUTPUT.PUT_LINE(mod_pow(7, 0, 13));
END;
/
