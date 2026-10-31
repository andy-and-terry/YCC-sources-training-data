CREATE OR REPLACE FUNCTION is_self_describing(p_s IN VARCHAR2) RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    FOR i IN 0 .. LENGTH(p_s) - 1 LOOP
        v_count := LENGTH(p_s) - LENGTH(REPLACE(p_s, TO_CHAR(i), ''));
        IF v_count != TO_NUMBER(SUBSTR(p_s, i + 1, 1)) THEN
            RETURN 0;
        END IF;
    END LOOP;
    RETURN 1;
END is_self_describing;
/

SELECT s, is_self_describing(s) AS result FROM (
    SELECT '1210' AS s FROM dual UNION ALL SELECT '2020' FROM dual
    UNION ALL SELECT '21200' FROM dual UNION ALL SELECT '1211' FROM dual
);
