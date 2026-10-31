CREATE OR REPLACE FUNCTION is_sphenic(p_n IN NUMBER) RETURN NUMBER IS
    v_n        NUMBER := p_n;
    v_p        NUMBER := 2;
    v_distinct NUMBER := 0;
BEGIN
    WHILE v_p * v_p <= v_n LOOP
        IF MOD(v_n, v_p) = 0 THEN
            v_n := v_n / v_p;
            IF MOD(v_n, v_p) = 0 THEN
                RETURN 0;
            END IF;
            v_distinct := v_distinct + 1;
        END IF;
        v_p := v_p + 1;
    END LOOP;
    IF v_n > 1 THEN
        v_distinct := v_distinct + 1;
    END IF;
    RETURN CASE WHEN v_distinct = 3 THEN 1 ELSE 0 END;
END is_sphenic;
/

BEGIN
    FOR n IN 2 .. 79 LOOP
        IF is_sphenic(n) = 1 THEN
            DBMS_OUTPUT.PUT_LINE(n);
        END IF;
    END LOOP;
END;
/
