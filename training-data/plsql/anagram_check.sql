CREATE OR REPLACE FUNCTION normalize_str(p_str IN VARCHAR2) RETURN VARCHAR2 IS
    result VARCHAR2(200) := '';
    chars VARCHAR2(200);
BEGIN
    chars := REPLACE(LOWER(p_str), ' ', '');
    FOR c IN (SELECT SUBSTR(chars, LEVEL, 1) AS ch
              FROM DUAL
              CONNECT BY LEVEL <= LENGTH(chars)
              ORDER BY SUBSTR(chars, LEVEL, 1)) LOOP
        result := result || c.ch;
    END LOOP;
    RETURN result;
END normalize_str;
/

CREATE OR REPLACE FUNCTION is_anagram(p_a IN VARCHAR2, p_b IN VARCHAR2) RETURN NUMBER IS
BEGIN
    IF normalize_str(p_a) = normalize_str(p_b) THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END is_anagram;
/
