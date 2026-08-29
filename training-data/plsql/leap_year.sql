CREATE OR REPLACE FUNCTION is_leap_year(p_year IN NUMBER) RETURN NUMBER IS
BEGIN
    IF (MOD(p_year, 4) = 0 AND MOD(p_year, 100) != 0) OR MOD(p_year, 400) = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END is_leap_year;
/
