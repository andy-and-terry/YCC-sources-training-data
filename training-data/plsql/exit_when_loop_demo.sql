-- Simple LOOP with EXIT WHEN: Euclid's algorithm and a running-sum search.
CREATE OR REPLACE FUNCTION loop_gcd(p_a IN PLS_INTEGER, p_b IN PLS_INTEGER) RETURN PLS_INTEGER IS
    v_a PLS_INTEGER := p_a;
    v_b PLS_INTEGER := p_b;
    v_t PLS_INTEGER;
BEGIN
    LOOP
        EXIT WHEN v_b = 0;
        v_t := MOD(v_a, v_b);
        v_a := v_b;
        v_b := v_t;
    END LOOP;
    RETURN v_a;
END loop_gcd;
/

DECLARE
    v_sum PLS_INTEGER := 0;
    v_n   PLS_INTEGER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('gcd(48, 18) = ' || loop_gcd(48, 18));
    LOOP
        v_n := v_n + 1;
        v_sum := v_sum + v_n;
        EXIT WHEN v_sum > 100;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('sum exceeds 100 at n = ' || v_n);
END;
/
