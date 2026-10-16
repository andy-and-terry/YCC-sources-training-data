DECLARE
    v_term VARCHAR2(4000) := '1';
    v_next VARCHAR2(4000);
    v_cnt  PLS_INTEGER;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_term);
    FOR step IN 1 .. 7 LOOP
        v_next := NULL;
        v_cnt := 1;
        FOR i IN 2 .. LENGTH(v_term) + 1 LOOP
            IF i <= LENGTH(v_term) AND SUBSTR(v_term, i, 1) = SUBSTR(v_term, i - 1, 1) THEN
                v_cnt := v_cnt + 1;
            ELSE
                v_next := v_next || v_cnt || SUBSTR(v_term, i - 1, 1);
                v_cnt := 1;
            END IF;
        END LOOP;
        v_term := v_next;
        DBMS_OUTPUT.PUT_LINE(v_term);
    END LOOP;
END;
/
