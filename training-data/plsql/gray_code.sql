DECLARE
    FUNCTION bit_xor(a PLS_INTEGER, b PLS_INTEGER) RETURN PLS_INTEGER IS
    BEGIN
        RETURN a + b - 2 * BITAND(a, b);
    END;

    FUNCTION to_bin(p_n PLS_INTEGER, p_width PLS_INTEGER) RETURN VARCHAR2 IS
        v_n   PLS_INTEGER := p_n;
        v_out VARCHAR2(32);
    BEGIN
        WHILE v_n > 0 LOOP
            v_out := MOD(v_n, 2) || v_out;
            v_n := TRUNC(v_n / 2);
        END LOOP;
        RETURN LPAD(NVL(v_out, '0'), p_width, '0');
    END;
BEGIN
    FOR i IN 0 .. 7 LOOP
        DBMS_OUTPUT.PUT_LINE(to_bin(i, 3) || ' -> ' || to_bin(bit_xor(i, TRUNC(i / 2)), 3));
    END LOOP;
END;
/
