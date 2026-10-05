DECLARE
    a NUMBER := NULL;
    b NUMBER := NULL;
    c NUMBER := 5;
    grade CHAR(1) := 'B';
BEGIN
    DBMS_OUTPUT.PUT_LINE('nvl: ' || NVL(a, 0));
    DBMS_OUTPUT.PUT_LINE('nvl2: ' || NVL2(a, 'has value', 'is null'));
    DBMS_OUTPUT.PUT_LINE('coalesce: ' || COALESCE(a, b, c));
    DBMS_OUTPUT.PUT_LINE('nullif: ' || NVL(TO_CHAR(NULLIF(c, 5)), 'null'));
    DBMS_OUTPUT.PUT_LINE('greatest: ' || GREATEST(3, 9, 4) || ', least: ' || LEAST(3, 9, 4));
    IF a IS NULL AND b IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('both null; a = b is not true: ' ||
            CASE WHEN a = b THEN 'equal' ELSE 'unknown/false' END);
    END IF;
    DBMS_OUTPUT.PUT_LINE(CASE grade WHEN 'A' THEN 'top' WHEN 'B' THEN 'good' ELSE 'other' END);
END;
/
