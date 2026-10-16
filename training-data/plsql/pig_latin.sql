DECLARE
    FUNCTION pig_word(p_word VARCHAR2) RETURN VARCHAR2 IS
        v_pos PLS_INTEGER;
    BEGIN
        IF REGEXP_LIKE(p_word, '^[aeiouAEIOU]') THEN
            RETURN p_word || 'way';
        END IF;
        v_pos := REGEXP_INSTR(p_word, '[aeiouAEIOU]');
        IF v_pos = 0 THEN
            RETURN p_word || 'ay';
        END IF;
        RETURN SUBSTR(p_word, v_pos) || SUBSTR(p_word, 1, v_pos - 1) || 'ay';
    END;
BEGIN
    FOR w IN (SELECT REGEXP_SUBSTR('the quick apple string', '[^ ]+', 1, LEVEL) AS word
                FROM dual
             CONNECT BY REGEXP_SUBSTR('the quick apple string', '[^ ]+', 1, LEVEL) IS NOT NULL) LOOP
        DBMS_OUTPUT.PUT_LINE(w.word || ' -> ' || pig_word(w.word));
    END LOOP;
END;
/
