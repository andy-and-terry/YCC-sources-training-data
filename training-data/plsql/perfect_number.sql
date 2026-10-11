DECLARE
    v_sum PLS_INTEGER;
BEGIN
    FOR n IN 2 .. 10000 LOOP
        v_sum := 1;
        FOR d IN 2 .. TRUNC(SQRT(n)) LOOP
            IF MOD(n, d) = 0 THEN
                v_sum := v_sum + d;
                IF d <> n / d THEN
                    v_sum := v_sum + n / d;
                END IF;
            END IF;
        END LOOP;
        IF v_sum = n THEN
            DBMS_OUTPUT.PUT_LINE('Perfect: ' || n);
        END IF;
    END LOOP;
END;
/
