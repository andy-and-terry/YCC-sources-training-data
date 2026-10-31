CREATE OR REPLACE FUNCTION cube_from_odds(p_n IN NUMBER) RETURN NUMBER IS
    v_start NUMBER := p_n * p_n - p_n + 1;
    v_sum   NUMBER := 0;
BEGIN
    FOR i IN 0 .. p_n - 1 LOOP
        v_sum := v_sum + v_start + 2 * i;
    END LOOP;
    RETURN v_sum;
END cube_from_odds;
/

BEGIN
    FOR n IN 1 .. 5 LOOP
        DBMS_OUTPUT.PUT_LINE(n || ' ' || cube_from_odds(n) || ' ' ||
            CASE WHEN cube_from_odds(n) = n * n * n THEN 'true' ELSE 'false' END);
    END LOOP;
END;
/
