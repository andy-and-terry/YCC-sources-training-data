DECLARE
    v_clob   CLOB;
    v_chunk  VARCHAR2(100) := 'The quick brown fox jumps over the lazy dog. ';
    v_pos    PLS_INTEGER;
    v_piece  VARCHAR2(50);
BEGIN
    DBMS_LOB.CREATETEMPORARY(v_clob, TRUE);

    FOR i IN 1 .. 3 LOOP
        DBMS_LOB.WRITEAPPEND(v_clob, LENGTH(v_chunk), v_chunk);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Length: ' || DBMS_LOB.GETLENGTH(v_clob));

    v_pos := DBMS_LOB.INSTR(v_clob, 'fox', 1, 2);
    DBMS_OUTPUT.PUT_LINE('Second fox at: ' || v_pos);

    v_piece := DBMS_LOB.SUBSTR(v_clob, 19, 1);
    DBMS_OUTPUT.PUT_LINE('Substr: ' || v_piece);

    DBMS_LOB.TRIM(v_clob, 44);
    DBMS_OUTPUT.PUT_LINE('After trim: ' || DBMS_LOB.GETLENGTH(v_clob));

    DBMS_LOB.FREETEMPORARY(v_clob);
END;
/
