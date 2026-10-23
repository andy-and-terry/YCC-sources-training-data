-- NULL-handling functions side by side.
DECLARE
    v_a NUMBER := NULL;
    v_b NUMBER := 7;
BEGIN
    DBMS_OUTPUT.PUT_LINE('NVL: '       || NVL(v_a, 0));
    DBMS_OUTPUT.PUT_LINE('NVL2: '      || NVL2(v_a, 'has value', 'is null'));
    DBMS_OUTPUT.PUT_LINE('COALESCE: '  || COALESCE(v_a, v_b, 99));
    DBMS_OUTPUT.PUT_LINE('NULLIF: '    || NVL(TO_CHAR(NULLIF(v_b, 7)), 'null'));
END;
/
