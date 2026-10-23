-- Common string utilities: LPAD, RPAD, TRIM, INSTR, SUBSTR, REPLACE.
BEGIN
    DBMS_OUTPUT.PUT_LINE(LPAD('42', 6, '0'));
    DBMS_OUTPUT.PUT_LINE(RPAD('ab', 5, '.') || '|');
    DBMS_OUTPUT.PUT_LINE('[' || TRIM('  hi  ') || ']');
    DBMS_OUTPUT.PUT_LINE(INSTR('hello world', 'o', 1, 2));
    DBMS_OUTPUT.PUT_LINE(SUBSTR('hello world', -5));
    DBMS_OUTPUT.PUT_LINE(REPLACE('a-b-c', '-', '+'));
    DBMS_OUTPUT.PUT_LINE(INITCAP('plsql is fun'));
END;
/
