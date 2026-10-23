DECLARE
    v_clob   CLOB;
    v_chunk  VARCHAR2(100);
    v_len    PLS_INTEGER;
    v_pos    PLS_INTEGER;
    v_amount PLS_INTEGER;
BEGIN
    DBMS_LOB.CREATETEMPORARY(v_clob, TRUE);

    DBMS_LOB.WRITEAPPEND(v_clob, 19, 'PL/SQL handles big ');
    DBMS_LOB.WRITEAPPEND(v_clob, 21, 'text values as CLOBs.');
    DBMS_LOB.APPEND(v_clob, TO_CLOB(' Appended later.'));

    v_len := DBMS_LOB.GETLENGTH(v_clob);
    DBMS_OUTPUT.PUT_LINE('length: ' || v_len);

    v_amount := 20;
    DBMS_LOB.READ(v_clob, v_amount, 1, v_chunk);
    DBMS_OUTPUT.PUT_LINE('first ' || v_amount || ' chars: [' || v_chunk || ']');

    v_pos := DBMS_LOB.INSTR(v_clob, 'CLOB', 1, 1);
    DBMS_OUTPUT.PUT_LINE('position of CLOB: ' || v_pos);

    DBMS_OUTPUT.PUT_LINE('substr: ' || DBMS_LOB.SUBSTR(v_clob, 8, v_pos - 3));

    -- overwrite in place, then trim
    DBMS_LOB.WRITE(v_clob, 4, 1, 'Pure');
    DBMS_LOB.TRIM(v_clob, 18);
    DBMS_OUTPUT.PUT_LINE('after write+trim: [' || DBMS_LOB.SUBSTR(v_clob, 100, 1) || ']');

    DBMS_OUTPUT.PUT_LINE('is temporary: ' || DBMS_LOB.ISTEMPORARY(v_clob));
    DBMS_LOB.FREETEMPORARY(v_clob);
END;
/
