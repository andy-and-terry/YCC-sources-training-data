CREATE OR REPLACE FUNCTION digit_sum(p_n IN NUMBER) RETURN NUMBER IS
    total NUMBER := 0;
    n NUMBER := p_n;
BEGIN
    WHILE n > 0 LOOP
        total := total + MOD(n, 10);
        n := TRUNC(n / 10);
    END LOOP;
    RETURN total;
END digit_sum;
/
