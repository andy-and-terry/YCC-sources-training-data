DECLARE
    v_a NUMBER := NULL;
    v_b NUMBER := NULL;
    v_c NUMBER := 7;
BEGIN
    DBMS_OUTPUT.PUT_LINE('NVL: ' || NVL(v_a, 0));
    DBMS_OUTPUT.PUT_LINE('COALESCE: ' || COALESCE(v_a, v_b, v_c));
    DBMS_OUTPUT.PUT_LINE('NVL2: ' || NVL2(v_c, 'has value', 'is null'));
    DBMS_OUTPUT.PUT_LINE('NULLIF: ' || NVL(TO_CHAR(NULLIF(5, 5)), 'null'));
    IF v_a IS NULL AND v_b IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('both null');
    END IF;
END;
/
