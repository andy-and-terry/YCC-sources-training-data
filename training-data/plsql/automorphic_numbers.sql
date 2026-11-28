CREATE OR REPLACE FUNCTION is_automorphic(p_n IN NUMBER) RETURN NUMBER IS
    v_sq VARCHAR2(40) := TO_CHAR(p_n * p_n);
    v_s VARCHAR2(20) := TO_CHAR(p_n);
BEGIN
    RETURN CASE WHEN SUBSTR(v_sq, -LENGTH(v_s)) = v_s THEN 1 ELSE 0 END;
END is_automorphic;
/

BEGIN
    FOR n IN 0..999 LOOP
        IF is_automorphic(n) = 1 THEN
            DBMS_OUTPUT.PUT(n || ' ');
        END IF;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE; -- 0 1 5 6 25 76 376 625
END;
/
