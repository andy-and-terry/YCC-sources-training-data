DECLARE
    v_attempt PLS_INTEGER := 0;
    v_found   BOOLEAN := FALSE;
BEGIN
    <<retry>>
    v_attempt := v_attempt + 1;
    DBMS_OUTPUT.PUT_LINE('attempt ' || v_attempt);
    IF v_attempt < 3 THEN
        GOTO retry;
    END IF;

    FOR i IN 1 .. 5 LOOP
        FOR j IN 1 .. 5 LOOP
            IF i * j = 12 THEN
                DBMS_OUTPUT.PUT_LINE('found ' || i || ' x ' || j);
                v_found := TRUE;
                GOTO done;
            END IF;
        END LOOP;
    END LOOP;
    <<done>>
    DBMS_OUTPUT.PUT_LINE('finished, found=' || CASE WHEN v_found THEN 'yes' ELSE 'no' END);
END;
/
