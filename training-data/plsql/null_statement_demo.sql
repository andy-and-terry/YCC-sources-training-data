DECLARE
    v_grade CHAR(1) := 'C';
BEGIN
    CASE v_grade
        WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('excellent');
        WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('good');
        WHEN 'C' THEN NULL;
        ELSE DBMS_OUTPUT.PUT_LINE('unknown');
    END CASE;

    IF v_grade IN ('A', 'B') THEN
        DBMS_OUTPUT.PUT_LINE('pass with honors');
    ELSE
        NULL;
    END IF;

    DBMS_OUTPUT.PUT_LINE('NULL statement does nothing, and is_null: ' ||
        CASE WHEN v_grade IS NULL THEN 'yes' ELSE 'no' END);
END;
/
