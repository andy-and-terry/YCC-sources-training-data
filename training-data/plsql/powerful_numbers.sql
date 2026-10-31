CREATE OR REPLACE FUNCTION is_powerful(p_n IN NUMBER) RETURN NUMBER IS
    v_n NUMBER := p_n;
    v_p NUMBER := 2;
BEGIN
    WHILE v_p * v_p <= v_n LOOP
        IF MOD(v_n, v_p) = 0 THEN
            IF MOD(v_n, v_p * v_p) != 0 THEN
                RETURN 0;
            END IF;
            WHILE MOD(v_n, v_p) = 0 LOOP
                v_n := v_n / v_p;
            END LOOP;
        END IF;
        v_p := v_p + 1;
    END LOOP;
    RETURN CASE WHEN v_n = 1 THEN 1 ELSE 0 END;
END is_powerful;
/

BEGIN
    FOR n IN 1 .. 100 LOOP
        IF is_powerful(n) = 1 THEN
            DBMS_OUTPUT.PUT_LINE(n);
        END IF;
    END LOOP;
END;
/
