CREATE OR REPLACE FUNCTION is_armstrong(p_n IN NUMBER) RETURN NUMBER IS
    v_len NUMBER := LENGTH(TO_CHAR(p_n));
    v_total NUMBER := 0;
    v_m NUMBER := p_n;
BEGIN
    WHILE v_m > 0 LOOP
        v_total := v_total + POWER(MOD(v_m, 10), v_len);
        v_m := TRUNC(v_m / 10);
    END LOOP;
    RETURN CASE WHEN v_total = p_n THEN 1 ELSE 0 END;
END is_armstrong;
/

BEGIN
    FOR n IN 1..999 LOOP
        IF is_armstrong(n) = 1 THEN
            DBMS_OUTPUT.PUT(n || ' ');
        END IF;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE; -- 1..9 153 370 371 407
END;
/
