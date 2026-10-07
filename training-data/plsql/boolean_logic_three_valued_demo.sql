-- Three-valued logic: AND/OR/NOT with NULL (unknown).
CREATE OR REPLACE FUNCTION bool_text(p_b IN BOOLEAN) RETURN VARCHAR2 IS
BEGIN
    RETURN CASE WHEN p_b THEN 'TRUE' WHEN NOT p_b THEN 'FALSE' ELSE 'NULL' END;
END bool_text;
/

DECLARE
    v_t BOOLEAN := TRUE;
    v_f BOOLEAN := FALSE;
    v_n BOOLEAN := NULL;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TRUE  AND NULL = ' || bool_text(v_t AND v_n));
    DBMS_OUTPUT.PUT_LINE('FALSE AND NULL = ' || bool_text(v_f AND v_n));
    DBMS_OUTPUT.PUT_LINE('TRUE  OR  NULL = ' || bool_text(v_t OR v_n));
    DBMS_OUTPUT.PUT_LINE('FALSE OR  NULL = ' || bool_text(v_f OR v_n));
    DBMS_OUTPUT.PUT_LINE('NOT NULL       = ' || bool_text(NOT v_n));
END;
/
