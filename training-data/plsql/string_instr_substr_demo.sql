DECLARE
    v_path VARCHAR2(100) := '/usr/local/lib/libfoo.so.1';
    v_last PLS_INTEGER;
BEGIN
    v_last := INSTR(v_path, '/', -1);
    DBMS_OUTPUT.PUT_LINE('directory: ' || SUBSTR(v_path, 1, v_last - 1));
    DBMS_OUTPUT.PUT_LINE('file:      ' || SUBSTR(v_path, v_last + 1));
    DBMS_OUTPUT.PUT_LINE('2nd slash: ' || INSTR(v_path, '/', 1, 2));
    DBMS_OUTPUT.PUT_LINE('last 4:    ' || SUBSTR(v_path, -4));
    DBMS_OUTPUT.PUT_LINE('ext:       ' || SUBSTR(v_path, INSTR(v_path, '.') + 1));
    DBMS_OUTPUT.PUT_LINE('not found: ' || INSTR(v_path, 'zzz'));
END;
/
