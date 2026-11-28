CREATE OR REPLACE FUNCTION plus_one_digits(p_digits IN VARCHAR2) RETURN VARCHAR2 IS
    v_result VARCHAR2(100) := p_digits;
    i PLS_INTEGER := LENGTH(p_digits);
    d PLS_INTEGER;
BEGIN
    WHILE i >= 1 LOOP
        d := TO_NUMBER(SUBSTR(v_result, i, 1));
        IF d < 9 THEN
            RETURN SUBSTR(v_result, 1, i - 1) || (d + 1) || SUBSTR(v_result, i + 1);
        END IF;
        v_result := SUBSTR(v_result, 1, i - 1) || '0' || SUBSTR(v_result, i + 1);
        i := i - 1;
    END LOOP;
    RETURN '1' || v_result;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(plus_one_digits('129')); -- 130
    DBMS_OUTPUT.PUT_LINE(plus_one_digits('99'));  -- 100
END;
/
