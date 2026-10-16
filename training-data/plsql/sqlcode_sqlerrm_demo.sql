DECLARE
    v_n NUMBER;
    v_s VARCHAR2(2);

    PROCEDURE report(p_step VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(p_step || ': SQLCODE=' || SQLCODE || ' ' || SQLERRM);
    END;
BEGIN
    BEGIN v_n := 1 / 0; EXCEPTION WHEN OTHERS THEN report('divide'); END;
    BEGIN v_n := TO_NUMBER('abc'); EXCEPTION WHEN OTHERS THEN report('convert'); END;
    BEGIN v_s := 'toolong'; EXCEPTION WHEN OTHERS THEN report('assign'); END;
    BEGIN SELECT 1 INTO v_n FROM dual WHERE 1 = 0; EXCEPTION WHEN OTHERS THEN report('select'); END;
    report('no error');
END;
/
