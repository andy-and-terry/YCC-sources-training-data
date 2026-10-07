-- DETERMINISTIC functions can be reused safely in SQL expressions
-- and in function-based indexes.
CREATE OR REPLACE FUNCTION celsius_to_fahrenheit(p_c IN NUMBER)
    RETURN NUMBER DETERMINISTIC
IS
BEGIN
    RETURN p_c * 9 / 5 + 32;
END celsius_to_fahrenheit;
/

CREATE OR REPLACE FUNCTION is_palindrome_word(p_word IN VARCHAR2)
    RETURN NUMBER DETERMINISTIC
IS
    v_clean VARCHAR2(200) := LOWER(REGEXP_REPLACE(p_word, '[^[:alnum:]]', ''));
BEGIN
    RETURN CASE WHEN v_clean = REVERSE(v_clean) THEN 1 ELSE 0 END;
END is_palindrome_word;
/

SELECT celsius_to_fahrenheit(LEVEL * 25) AS f
  FROM dual
CONNECT BY LEVEL <= 4;

SELECT is_palindrome_word('A man, a plan, a canal: Panama') AS yes FROM dual;
