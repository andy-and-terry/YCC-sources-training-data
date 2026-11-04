CREATE OR REPLACE FUNCTION to_base (p_n IN NUMBER, p_base IN PLS_INTEGER) RETURN VARCHAR2 IS
    c_digits CONSTANT VARCHAR2(36) := '0123456789abcdefghijklmnopqrstuvwxyz';
    v_n NUMBER := p_n;
    v_out VARCHAR2(64);
BEGIN
    IF v_n = 0 THEN RETURN '0'; END IF;
    WHILE v_n > 0 LOOP
        v_out := SUBSTR(c_digits, MOD(v_n, p_base) + 1, 1) || v_out;
        v_n := TRUNC(v_n / p_base);
    END LOOP;
    RETURN v_out;
END to_base;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('255 in base 2 = ' || to_base(255, 2));
    DBMS_OUTPUT.PUT_LINE('255 in base 16 = ' || to_base(255, 16));
    DBMS_OUTPUT.PUT_LINE('255 in base 36 = ' || to_base(255, 36));
END;
/
