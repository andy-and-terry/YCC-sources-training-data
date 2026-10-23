-- REVERSE counts down, and the bounds are evaluated only once on entry.
DECLARE
    v_limit PLS_INTEGER := 3;
    v_line  VARCHAR2(100);
BEGIN
    FOR i IN REVERSE 1 .. 5 LOOP
        v_line := v_line || i || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Countdown: ' || RTRIM(v_line));

    -- Changing the limit inside the loop has no effect on iteration count.
    v_line := NULL;
    FOR i IN 1 .. v_limit LOOP
        v_limit := 10;
        v_line := v_line || i || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Fixed bounds: ' || RTRIM(v_line));

    -- A loop whose lower bound exceeds the upper bound runs zero times.
    FOR i IN 5 .. 1 LOOP
        DBMS_OUTPUT.PUT_LINE('never printed');
    END LOOP;

    -- PL/SQL has no STEP clause; multiply the index for strides.
    v_line := NULL;
    FOR i IN 0 .. 4 LOOP
        v_line := v_line || (i * 5) || ' ';
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Step of 5: ' || RTRIM(v_line));
END;
/
