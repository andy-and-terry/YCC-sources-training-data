-- WHILE loop and MOD/TRUNC arithmetic to reverse an integer.
CREATE OR REPLACE FUNCTION reverse_number(p_n IN PLS_INTEGER) RETURN PLS_INTEGER IS
    v_n   PLS_INTEGER := ABS(p_n);
    v_rev PLS_INTEGER := 0;
BEGIN
    WHILE v_n > 0 LOOP
        v_rev := v_rev * 10 + MOD(v_n, 10);
        v_n := TRUNC(v_n / 10);
    END LOOP;
    RETURN SIGN(p_n) * v_rev;
END reverse_number;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(reverse_number(12345));
    DBMS_OUTPUT.PUT_LINE(reverse_number(-9870));
    DBMS_OUTPUT.PUT_LINE(reverse_number(0));
END;
/
