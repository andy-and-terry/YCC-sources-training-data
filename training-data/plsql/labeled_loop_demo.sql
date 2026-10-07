-- Labeled loops with EXIT/CONTINUE targeting the outer loop.
CREATE OR REPLACE PROCEDURE labeled_loop_demo IS
    v_found BOOLEAN := FALSE;
BEGIN
    <<rows_loop>>
    FOR r IN 1..5 LOOP
        <<cols_loop>>
        FOR c IN 1..5 LOOP
            CONTINUE rows_loop WHEN c > r;
            IF r * c = 12 THEN
                DBMS_OUTPUT.PUT_LINE('found 12 at row ' || r || ', col ' || c);
                v_found := TRUE;
                EXIT rows_loop;
            END IF;
        END LOOP cols_loop;
    END LOOP rows_loop;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('no product equal to 12');
    END IF;
END labeled_loop_demo;
/
