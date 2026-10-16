DECLARE
    FUNCTION isbn10_valid(p_isbn VARCHAR2) RETURN BOOLEAN IS
        v_clean VARCHAR2(20) := REPLACE(p_isbn, '-', '');
        v_sum   PLS_INTEGER := 0;
        v_ch    VARCHAR2(1);
    BEGIN
        IF NOT REGEXP_LIKE(v_clean, '^[0-9]{9}[0-9X]$') THEN
            RETURN FALSE;
        END IF;
        FOR i IN 1 .. 10 LOOP
            v_ch := SUBSTR(v_clean, i, 1);
            v_sum := v_sum + (11 - i) * CASE WHEN v_ch = 'X' THEN 10 ELSE TO_NUMBER(v_ch) END;
        END LOOP;
        RETURN MOD(v_sum, 11) = 0;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('3-598-21508-8: ' || CASE WHEN isbn10_valid('3-598-21508-8') THEN 'valid' ELSE 'invalid' END);
    DBMS_OUTPUT.PUT_LINE('3-598-21507-X: ' || CASE WHEN isbn10_valid('3-598-21507-X') THEN 'valid' ELSE 'invalid' END);
    DBMS_OUTPUT.PUT_LINE('3-598-2K507-0: ' || CASE WHEN isbn10_valid('3-598-2K507-0') THEN 'valid' ELSE 'invalid' END);
END;
/
