DECLARE
    v_text VARCHAR2(50) := '  Oracle PL/SQL  ';
BEGIN
    DBMS_OUTPUT.PUT_LINE('[' || TRIM(v_text) || ']');
    DBMS_OUTPUT.PUT_LINE(LPAD('7', 4, '0'));
    DBMS_OUTPUT.PUT_LINE(RPAD('ab', 5, '*') || '|');
    DBMS_OUTPUT.PUT_LINE(INSTR('hello world', 'o', 1, 2));
    DBMS_OUTPUT.PUT_LINE(SUBSTR('abcdef', -3, 2));
    DBMS_OUTPUT.PUT_LINE(REPLACE('a-b-c', '-', '+'));
    DBMS_OUTPUT.PUT_LINE(INITCAP('hello big world'));
    DBMS_OUTPUT.PUT_LINE(TRANSLATE('hello', 'el', 'ip'));
END;
/
