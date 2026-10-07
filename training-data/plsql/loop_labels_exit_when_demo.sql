DECLARE
    found_i PLS_INTEGER;
    found_j PLS_INTEGER;
BEGIN
    <<outer_loop>>
    FOR i IN 1 .. 10 LOOP
        <<inner_loop>>
        FOR j IN 1 .. 10 LOOP
            CONTINUE inner_loop WHEN MOD(j, 2) = 1;
            EXIT outer_loop WHEN i * j = 24;
            found_i := i;
            found_j := j;
        END LOOP inner_loop;
    END LOOP outer_loop;
    DBMS_OUTPUT.PUT_LINE('last before exit: i=' || found_i || ' j=' || found_j);

    FOR k IN REVERSE 1 .. 3 LOOP
        DBMS_OUTPUT.PUT_LINE('countdown ' || k);
    END LOOP;
END;
/
