CREATE OR REPLACE FUNCTION square_cached(p_n IN NUMBER)
    RETURN NUMBER
    RESULT_CACHE
    DETERMINISTIC
IS
BEGIN
    -- Repeated calls with the same argument are served from the result cache.
    RETURN p_n * p_n;
END square_cached;
/

CREATE OR REPLACE PROCEDURE result_cache_function_demo IS
    v_total NUMBER := 0;
BEGIN
    FOR i IN 1 .. 5 LOOP
        v_total := v_total + square_cached(MOD(i, 2) + 2);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
END result_cache_function_demo;
/
