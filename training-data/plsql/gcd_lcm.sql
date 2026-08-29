CREATE OR REPLACE FUNCTION my_gcd(p_a IN NUMBER, p_b IN NUMBER) RETURN NUMBER IS
    a NUMBER := p_a;
    b NUMBER := p_b;
    t NUMBER;
BEGIN
    WHILE b != 0 LOOP
        t := b;
        b := MOD(a, b);
        a := t;
    END LOOP;
    RETURN ABS(a);
END my_gcd;
/

CREATE OR REPLACE FUNCTION my_lcm(p_a IN NUMBER, p_b IN NUMBER) RETURN NUMBER IS
BEGIN
    RETURN ABS(p_a * p_b) / my_gcd(p_a, p_b);
END my_lcm;
/
