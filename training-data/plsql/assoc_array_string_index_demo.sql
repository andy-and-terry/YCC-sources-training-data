DECLARE
    TYPE count_map IS TABLE OF PLS_INTEGER INDEX BY VARCHAR2(30);
    v_counts count_map;
    v_text   VARCHAR2(200) := 'the cat and the hat and the bat';
    v_word   VARCHAR2(30);
    v_pos    PLS_INTEGER := 1;
    v_next   PLS_INTEGER;
    v_key    VARCHAR2(30);
BEGIN
    LOOP
        v_next := INSTR(v_text, ' ', v_pos);
        v_word := CASE WHEN v_next = 0 THEN SUBSTR(v_text, v_pos) ELSE SUBSTR(v_text, v_pos, v_next - v_pos) END;
        IF v_counts.EXISTS(v_word) THEN
            v_counts(v_word) := v_counts(v_word) + 1;
        ELSE
            v_counts(v_word) := 1;
        END IF;
        EXIT WHEN v_next = 0;
        v_pos := v_next + 1;
    END LOOP;

    v_key := v_counts.FIRST;
    WHILE v_key IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(v_key, 6) || v_counts(v_key));
        v_key := v_counts.NEXT(v_key);
    END LOOP;
END;
/
