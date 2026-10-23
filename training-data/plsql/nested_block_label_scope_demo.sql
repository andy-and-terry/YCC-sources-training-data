-- Inner blocks can shadow outer variables; a block label lets the inner
-- code reach the outer variable explicitly.
<<outer>>
DECLARE
    v_name VARCHAR2(20) := 'outer';
BEGIN
    DECLARE
        v_name VARCHAR2(20) := 'inner';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('inner sees: ' || v_name);
        DBMS_OUTPUT.PUT_LINE('label sees: ' || outer.v_name);
    END;
    DBMS_OUTPUT.PUT_LINE('outer sees: ' || v_name);
END outer;
/
