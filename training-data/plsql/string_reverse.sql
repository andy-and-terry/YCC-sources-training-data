CREATE OR REPLACE FUNCTION reverse_string(s IN VARCHAR2) RETURN VARCHAR2 IS
    result VARCHAR2(4000) := '';
BEGIN
    FOR i IN REVERSE 1..LENGTH(s) LOOP
        result := result || SUBSTR(s, i, 1);
    END LOOP;
    RETURN result;
END reverse_string;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(reverse_string('hello world'));
END;
/
