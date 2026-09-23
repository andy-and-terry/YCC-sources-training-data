-- Expand around every possible center (each single character, and each
-- gap between two characters, for even-length palindromes) and keep the
-- widest one that stays a palindrome.
CREATE OR REPLACE FUNCTION longest_palindrome(s IN VARCHAR2) RETURN VARCHAR2 IS
    best_start PLS_INTEGER := 1;
    best_len PLS_INTEGER := 0;
    lo PLS_INTEGER;
    hi PLS_INTEGER;
BEGIN
    FOR center IN 1..(2 * LENGTH(s) - 1) LOOP
        lo := CEIL(center / 2);
        hi := FLOOR(center / 2) + 1;

        WHILE lo >= 1 AND hi <= LENGTH(s) AND SUBSTR(s, lo, 1) = SUBSTR(s, hi, 1) LOOP
            IF hi - lo + 1 > best_len THEN
                best_start := lo;
                best_len := hi - lo + 1;
            END IF;
            lo := lo - 1;
            hi := hi + 1;
        END LOOP;
    END LOOP;
    RETURN SUBSTR(s, best_start, best_len);
END longest_palindrome;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(longest_palindrome('babad'));
    DBMS_OUTPUT.PUT_LINE(longest_palindrome('cbbd'));
    DBMS_OUTPUT.PUT_LINE(longest_palindrome('a'));
END;
/
