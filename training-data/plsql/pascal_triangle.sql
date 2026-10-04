DECLARE
    TYPE t_row IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    v_prev t_row;
    v_cur  t_row;
    v_line VARCHAR2(200);
BEGIN
    FOR r IN 0 .. 5 LOOP
        v_cur.DELETE;
        v_line := '';
        FOR c IN 0 .. r LOOP
            IF c = 0 OR c = r THEN
                v_cur(c) := 1;
            ELSE
                v_cur(c) := v_prev(c - 1) + v_prev(c);
            END IF;
            v_line := v_line || v_cur(c) || ' ';
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(v_line);
        v_prev := v_cur;
    END LOOP;
END;
/
