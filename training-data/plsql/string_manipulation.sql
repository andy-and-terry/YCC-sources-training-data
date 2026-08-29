CREATE OR REPLACE PROCEDURE string_manipulation_demo IS
    s VARCHAR2(50) := 'Hello, PL/SQL World!';
BEGIN
    DBMS_OUTPUT.PUT_LINE(UPPER(s));
    DBMS_OUTPUT.PUT_LINE(LOWER(s));
    DBMS_OUTPUT.PUT_LINE(LENGTH(s));
    DBMS_OUTPUT.PUT_LINE(SUBSTR(s, 1, 5));
    DBMS_OUTPUT.PUT_LINE(REPLACE(s, 'World', 'Programming'));
END string_manipulation_demo;
/
