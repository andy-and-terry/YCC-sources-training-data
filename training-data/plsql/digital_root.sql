DECLARE
    FUNCTION digital_root(p_n NUMBER) RETURN NUMBER IS
        v_n NUMBER := ABS(p_n);
        v_s NUMBER;
    BEGIN
        WHILE v_n >= 10 LOOP
            v_s := 0;
            WHILE v_n > 0 LOOP
                v_s := v_s + MOD(v_n, 10);
                v_n := TRUNC(v_n / 10);
            END LOOP;
            v_n := v_s;
        END LOOP;
        RETURN v_n;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('942 -> ' || digital_root(942));
    DBMS_OUTPUT.PUT_LINE('132189 -> ' || digital_root(132189));
    DBMS_OUTPUT.PUT_LINE('493193 -> ' || digital_root(493193));
    DBMS_OUTPUT.PUT_LINE('formula check: ' || (1 + MOD(493193 - 1, 9)));
END;
/
