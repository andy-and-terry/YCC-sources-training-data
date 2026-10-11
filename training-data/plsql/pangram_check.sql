DECLARE
    FUNCTION is_pangram(p_text VARCHAR2) RETURN BOOLEAN IS
        v_text VARCHAR2(4000) := UPPER(p_text);
    BEGIN
        FOR c IN 65 .. 90 LOOP
            IF INSTR(v_text, CHR(c)) = 0 THEN
                RETURN FALSE;
            END IF;
        END LOOP;
        RETURN TRUE;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE(CASE WHEN is_pangram('The quick brown fox jumps over the lazy dog') THEN 'pangram' ELSE 'not pangram' END);
    DBMS_OUTPUT.PUT_LINE(CASE WHEN is_pangram('Hello world') THEN 'pangram' ELSE 'not pangram' END);
END;
/
