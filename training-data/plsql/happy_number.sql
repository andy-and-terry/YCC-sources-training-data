DECLARE
    FUNCTION digit_square_sum(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
        v_n PLS_INTEGER := p_n;
        v_s PLS_INTEGER := 0;
    BEGIN
        WHILE v_n > 0 LOOP
            v_s := v_s + POWER(MOD(v_n, 10), 2);
            v_n := TRUNC(v_n / 10);
        END LOOP;
        RETURN v_s;
    END;

    FUNCTION is_happy(p_n PLS_INTEGER) RETURN BOOLEAN IS
        slow PLS_INTEGER := p_n;
        fast PLS_INTEGER := digit_square_sum(p_n);
    BEGIN
        WHILE fast <> 1 AND slow <> fast LOOP
            slow := digit_square_sum(slow);
            fast := digit_square_sum(digit_square_sum(fast));
        END LOOP;
        RETURN fast = 1;
    END;
BEGIN
    FOR n IN 1 .. 30 LOOP
        IF is_happy(n) THEN
            DBMS_OUTPUT.PUT_LINE(n || ' is happy');
        END IF;
    END LOOP;
END;
/
