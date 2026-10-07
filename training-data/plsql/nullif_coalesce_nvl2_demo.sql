-- NULL-handling functions: NVL, NVL2, COALESCE and NULLIF.
CREATE OR REPLACE PROCEDURE null_functions_demo IS
    v_a NUMBER := NULL;
    v_b NUMBER := 0;
    v_c NUMBER := 7;
BEGIN
    DBMS_OUTPUT.PUT_LINE('NVL: ' || NVL(v_a, -1));
    DBMS_OUTPUT.PUT_LINE('NVL2 (null): ' || NVL2(v_a, 'has value', 'is null'));
    DBMS_OUTPUT.PUT_LINE('NVL2 (set): ' || NVL2(v_c, 'has value', 'is null'));
    DBMS_OUTPUT.PUT_LINE('COALESCE: ' || COALESCE(v_a, NULLIF(v_b, 0), v_c));
    DBMS_OUTPUT.PUT_LINE('NULLIF equal: ' || NVL(TO_CHAR(NULLIF(v_c, 7)), 'NULL'));
    DBMS_OUTPUT.PUT_LINE('NULLIF differ: ' || NULLIF(v_c, 8));

    IF v_a = v_a THEN
        DBMS_OUTPUT.PUT_LINE('never reached: NULL = NULL is not TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('comparisons with NULL are never TRUE');
    END IF;
END null_functions_demo;
/
