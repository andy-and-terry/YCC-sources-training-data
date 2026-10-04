DECLARE
    a NUMBER := NULL;
    b NUMBER := 5;
    c VARCHAR2(10) := '';

    FUNCTION show(p_label VARCHAR2, p_value VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        RETURN p_label || ' = ' || NVL(p_value, '<null>');
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE(show('NVL(a, 0)', TO_CHAR(NVL(a, 0))));
    DBMS_OUTPUT.PUT_LINE(show('NVL2(a, 1, 2)', TO_CHAR(NVL2(a, 1, 2))));
    DBMS_OUTPUT.PUT_LINE(show('COALESCE(a, NULL, b)', TO_CHAR(COALESCE(a, NULL, b))));
    DBMS_OUTPUT.PUT_LINE(show('NULLIF(b, 5)', TO_CHAR(NULLIF(b, 5))));
    DBMS_OUTPUT.PUT_LINE(show('NULLIF(b, 6)', TO_CHAR(NULLIF(b, 6))));
    DBMS_OUTPUT.PUT_LINE(show('a + 1', TO_CHAR(a + 1)));
    DBMS_OUTPUT.PUT_LINE(show('empty string', c));
    IF c IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('empty string is NULL in Oracle');
    END IF;
    IF NOT (a = b) AND NOT (a <> b) THEN
        DBMS_OUTPUT.PUT_LINE('comparison with NULL is neither true nor false');
    END IF;
    DBMS_OUTPUT.PUT_LINE(show('GREATEST(1,3,2)', TO_CHAR(GREATEST(1, 3, 2))));
END;
/
