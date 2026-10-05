DECLARE
    s VARCHAR2(50) := 'Oracle PL/SQL Programming';
BEGIN
    DBMS_OUTPUT.PUT_LINE('instr: ' || INSTR(s, 'SQL'));
    DBMS_OUTPUT.PUT_LINE('substr: ' || SUBSTR(s, 8, 6));
    DBMS_OUTPUT.PUT_LINE('last 11: ' || SUBSTR(s, -11));
    DBMS_OUTPUT.PUT_LINE('lpad: ' || LPAD('7', 4, '0'));
    DBMS_OUTPUT.PUT_LINE('rpad: [' || RPAD('ab', 5, '.') || ']');
    DBMS_OUTPUT.PUT_LINE('trim: [' || TRIM('  x  ') || ']');
    DBMS_OUTPUT.PUT_LINE('replace: ' || REPLACE(s, 'o', '0'));
    DBMS_OUTPUT.PUT_LINE('translate: ' || TRANSLATE('hello', 'el', 'ip'));
    DBMS_OUTPUT.PUT_LINE('initcap: ' || INITCAP('hello world'));
    DBMS_OUTPUT.PUT_LINE('length: ' || LENGTH(s));
END;
/
