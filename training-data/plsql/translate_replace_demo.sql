DECLARE
    s VARCHAR2(60) := 'Hello, World 2024!';
BEGIN
    DBMS_OUTPUT.PUT_LINE(TRANSLATE(s, 'abcdefghij', '0123456789'));
    DBMS_OUTPUT.PUT_LINE(REPLACE(s, 'l', 'L'));
    DBMS_OUTPUT.PUT_LINE(REPLACE(s, ' '));                       -- remove spaces
    DBMS_OUTPUT.PUT_LINE(TRANSLATE(s, 'a0123456789', 'a'));      -- strip digits
    DBMS_OUTPUT.PUT_LINE(INITCAP('the quick brown fox'));
    DBMS_OUTPUT.PUT_LINE(LPAD('7', 3, '0') || ' ' || RPAD('ab', 5, '*') || '|');
    DBMS_OUTPUT.PUT_LINE(TRIM(BOTH '-' FROM '--core--') || ' ' || LTRIM('xxabc', 'x'));
    DBMS_OUTPUT.PUT_LINE(INSTR(s, 'o') || ' ' || INSTR(s, 'o', 6) || ' ' || INSTR(s, 'o', -1));
    DBMS_OUTPUT.PUT_LINE(SUBSTR(s, 8) || ' ' || SUBSTR(s, -5, 4));
    DBMS_OUTPUT.PUT_LINE(SOUNDEX('Smith') || ' ' || SOUNDEX('Smyth'));
    DBMS_OUTPUT.PUT_LINE(LENGTH(s) || ' ' || ASCII('A') || ' ' || CHR(66));
END;
/
