CREATE OR REPLACE FUNCTION alternating_digit_sum(p_n IN NUMBER) RETURN NUMBER IS
    v_n     NUMBER := p_n;
    v_total NUMBER := 0;
    v_sign  NUMBER := 1;
BEGIN
    WHILE v_n > 0 LOOP
        v_total := v_total + v_sign * MOD(v_n, 10);
        v_sign := -v_sign;
        v_n := TRUNC(v_n / 10);
    END LOOP;
    RETURN v_total;
END alternating_digit_sum;
/

SELECT 1234 AS n, alternating_digit_sum(1234) AS result FROM dual
UNION ALL SELECT 99999, alternating_digit_sum(99999) FROM dual
UNION ALL SELECT 1000, alternating_digit_sum(1000) FROM dual;
