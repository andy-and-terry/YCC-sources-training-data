CREATE OR REPLACE FUNCTION gcd (p_a IN NUMBER, p_b IN NUMBER) RETURN NUMBER IS
    v_a NUMBER := ABS(p_a);
    v_b NUMBER := ABS(p_b);
    v_t NUMBER;
BEGIN
    WHILE v_b <> 0 LOOP
        v_t := MOD(v_a, v_b);
        v_a := v_b;
        v_b := v_t;
    END LOOP;
    RETURN v_a;
END gcd;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(gcd(12, 18));
    DBMS_OUTPUT.PUT_LINE(gcd(gcd(12, 18), 24));
END;
/
