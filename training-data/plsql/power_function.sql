CREATE OR REPLACE FUNCTION my_power(p_base IN NUMBER, p_exp IN NUMBER) RETURN NUMBER IS
    half NUMBER;
BEGIN
    IF p_exp = 0 THEN
        RETURN 1;
    ELSIF MOD(p_exp, 2) = 0 THEN
        half := my_power(p_base, p_exp / 2);
        RETURN half * half;
    ELSE
        RETURN p_base * my_power(p_base, p_exp - 1);
    END IF;
END my_power;
/
