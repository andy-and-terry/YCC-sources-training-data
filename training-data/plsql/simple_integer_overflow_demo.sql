DECLARE
    v_si SIMPLE_INTEGER := 2147483645;
    v_pi PLS_INTEGER := 2147483645;
BEGIN
    FOR i IN 1 .. 4 LOOP
        v_si := v_si + 1;
        DBMS_OUTPUT.PUT_LINE('SIMPLE_INTEGER wraps: ' || v_si);
    END LOOP;
    BEGIN
        FOR i IN 1 .. 4 LOOP
            v_pi := v_pi + 1;
            DBMS_OUTPUT.PUT_LINE('PLS_INTEGER: ' || v_pi);
        END LOOP;
    EXCEPTION
        WHEN NUMERIC_OVERFLOW THEN
            DBMS_OUTPUT.PUT_LINE('PLS_INTEGER overflow raised');
    END;
END;
/
