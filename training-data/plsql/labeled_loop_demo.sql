DECLARE
    v_found BOOLEAN := FALSE;
BEGIN
    <<outer_loop>>
    FOR i IN 1 .. 5 LOOP
        FOR j IN 1 .. 5 LOOP
            IF i * j = 12 THEN
                DBMS_OUTPUT.PUT_LINE('found ' || i || ' x ' || j);
                v_found := TRUE;
                EXIT outer_loop;
            END IF;
        END LOOP;
    END LOOP outer_loop;
    DBMS_OUTPUT.PUT_LINE('found = ' || CASE WHEN v_found THEN 'yes' ELSE 'no' END);
END;
/
