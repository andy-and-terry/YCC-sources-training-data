DECLARE
    FUNCTION luhn_valid(p_num VARCHAR2) RETURN BOOLEAN IS
        v_sum PLS_INTEGER := 0;
        v_d   PLS_INTEGER;
        v_alt BOOLEAN := FALSE;
    BEGIN
        FOR i IN REVERSE 1 .. LENGTH(p_num) LOOP
            v_d := TO_NUMBER(SUBSTR(p_num, i, 1));
            IF v_alt THEN
                v_d := v_d * 2;
                IF v_d > 9 THEN v_d := v_d - 9; END IF;
            END IF;
            v_sum := v_sum + v_d;
            v_alt := NOT v_alt;
        END LOOP;
        RETURN MOD(v_sum, 10) = 0;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('4539578763621486 -> ' || CASE WHEN luhn_valid('4539578763621486') THEN 'valid' ELSE 'invalid' END);
    DBMS_OUTPUT.PUT_LINE('1234567812345678 -> ' || CASE WHEN luhn_valid('1234567812345678') THEN 'valid' ELSE 'invalid' END);
END;
/
