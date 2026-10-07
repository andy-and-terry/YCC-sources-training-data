CREATE OR REPLACE PROCEDURE nested_block_scope_demo IS
    v_name VARCHAR2(20) := 'outer';
BEGIN
    DBMS_OUTPUT.PUT_LINE('1: ' || v_name);
    DECLARE
        v_name VARCHAR2(20) := 'inner';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('2: ' || v_name);
        DBMS_OUTPUT.PUT_LINE('3: ' || nested_block_scope_demo.v_name);
    END;
    DBMS_OUTPUT.PUT_LINE('4: ' || v_name);
END nested_block_scope_demo;
/
