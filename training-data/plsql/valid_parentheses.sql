CREATE OR REPLACE FUNCTION is_valid_parens(p_str IN VARCHAR2) RETURN NUMBER IS
    TYPE char_table IS TABLE OF CHAR INDEX BY PLS_INTEGER;
    stack char_table;
    top_idx PLS_INTEGER := 0;
    c CHAR(1);
BEGIN
    FOR i IN 1..LENGTH(p_str) LOOP
        c := SUBSTR(p_str, i, 1);
        IF c IN ('(', '[', '{') THEN
            top_idx := top_idx + 1;
            stack(top_idx) := c;
        ELSIF c IN (')', ']', '}') THEN
            IF top_idx = 0 THEN
                RETURN 0;
            END IF;
            IF (c = ')' AND stack(top_idx) != '(') OR
               (c = ']' AND stack(top_idx) != '[') OR
               (c = '}' AND stack(top_idx) != '{') THEN
                RETURN 0;
            END IF;
            top_idx := top_idx - 1;
        END IF;
    END LOOP;
    IF top_idx = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END is_valid_parens;
/
