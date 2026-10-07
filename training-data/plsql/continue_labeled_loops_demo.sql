BEGIN
    -- CONTINUE skips to the next iteration
    FOR i IN 1 .. 10 LOOP
        CONTINUE WHEN MOD(i, 3) <> 0;
        DBMS_OUTPUT.PUT_LINE('multiple of 3: ' || i);
    END LOOP;

    -- labeled loops allow exiting or continuing the outer loop
    <<outer_loop>>
    FOR i IN 1 .. 4 LOOP
        <<inner_loop>>
        FOR j IN 1 .. 4 LOOP
            CONTINUE outer_loop WHEN j > i;
            EXIT outer_loop WHEN i * j = 9;
            DBMS_OUTPUT.PUT_LINE(i || ' x ' || j || ' = ' || i * j);
        END LOOP inner_loop;
    END LOOP outer_loop;

    -- reverse and stepped iteration
    FOR k IN REVERSE 1 .. 3 LOOP
        DBMS_OUTPUT.PUT('k=' || k || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;

    DECLARE
        n NUMBER := 27;
        steps NUMBER := 0;
    BEGIN
        WHILE n <> 1 LOOP
            n := CASE WHEN MOD(n, 2) = 0 THEN n / 2 ELSE 3 * n + 1 END;
            steps := steps + 1;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('collatz steps for 27: ' || steps);
    END;
END;
/
