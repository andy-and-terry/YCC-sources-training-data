CREATE OR REPLACE FUNCTION power_mod(p_base NUMBER, p_exp NUMBER, p_mod NUMBER)
RETURN NUMBER IS
    v_half NUMBER;
BEGIN
    IF p_exp = 0 THEN
        RETURN 1;
    END IF;
    v_half := power_mod(p_base, TRUNC(p_exp / 2), p_mod);
    IF MOD(p_exp, 2) = 0 THEN
        RETURN MOD(v_half * v_half, p_mod);
    END IF;
    RETURN MOD(MOD(v_half * v_half, p_mod) * p_base, p_mod);
END power_mod;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(power_mod(2, 10, 1000));
    DBMS_OUTPUT.PUT_LINE(power_mod(3, 200, 13));
END;
/
