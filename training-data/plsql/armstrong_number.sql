CREATE OR REPLACE FUNCTION is_armstrong(p_n IN NUMBER) RETURN NUMBER IS
    digits_str VARCHAR2(20) := TO_CHAR(p_n);
    power_val NUMBER := LENGTH(digits_str);
    total NUMBER := 0;
    d NUMBER;
BEGIN
    FOR i IN 1..LENGTH(digits_str) LOOP
        d := TO_NUMBER(SUBSTR(digits_str, i, 1));
        total := total + POWER(d, power_val);
    END LOOP;
    IF total = p_n THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END is_armstrong;
/
