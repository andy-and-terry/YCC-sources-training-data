DECLARE
    FUNCTION hamming(p_a VARCHAR2, p_b VARCHAR2) RETURN PLS_INTEGER IS
        v_d PLS_INTEGER := 0;
    BEGIN
        IF LENGTH(p_a) <> LENGTH(p_b) THEN
            RAISE_APPLICATION_ERROR(-20001, 'Strings must have equal length');
        END IF;
        FOR i IN 1 .. LENGTH(p_a) LOOP
            IF SUBSTR(p_a, i, 1) <> SUBSTR(p_b, i, 1) THEN
                v_d := v_d + 1;
            END IF;
        END LOOP;
        RETURN v_d;
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('karolin/kathrin: ' || hamming('karolin', 'kathrin'));
    DBMS_OUTPUT.PUT_LINE('1011101/1001001: ' || hamming('1011101', '1001001'));
    DBMS_OUTPUT.PUT_LINE(hamming('abc', 'ab'));
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
