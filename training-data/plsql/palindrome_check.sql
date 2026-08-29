CREATE OR REPLACE FUNCTION is_palindrome(p_str IN VARCHAR2) RETURN NUMBER IS
    normalized VARCHAR2(200) := '';
    c CHAR(1);
BEGIN
    FOR i IN 1..LENGTH(p_str) LOOP
        c := LOWER(SUBSTR(p_str, i, 1));
        IF REGEXP_LIKE(c, '[a-z0-9]') THEN
            normalized := normalized || c;
        END IF;
    END LOOP;
    IF normalized = REVERSE(normalized) THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END is_palindrome;
/
