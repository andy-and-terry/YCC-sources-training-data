CREATE OR REPLACE FUNCTION is_pronic(p_x IN NUMBER) RETURN NUMBER IS
    v_n NUMBER := FLOOR(SQRT(p_x));
BEGIN
    RETURN CASE WHEN v_n * (v_n + 1) = p_x THEN 1 ELSE 0 END;
END is_pronic;
/

SELECT LEVEL - 1 AS n, (LEVEL - 1) * LEVEL AS pronic
FROM dual
CONNECT BY LEVEL <= 10;
-- pronic: 0 2 6 12 20 30 42 56 72 90

SELECT is_pronic(56) AS yes, is_pronic(57) AS no FROM dual; -- 1, 0
