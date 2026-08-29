CREATE OR REPLACE FUNCTION is_power_of_two(p_n IN NUMBER) RETURN NUMBER IS
BEGIN
    IF p_n > 0 AND BITAND(p_n, p_n - 1) = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END is_power_of_two;
/
