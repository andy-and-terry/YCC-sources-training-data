-- Nested blocks: inner declarations shadow outer ones, and a label lets
-- the inner block still reach the outer variable by qualified name.
CREATE OR REPLACE PROCEDURE nested_block_scope_demo IS
BEGIN
    <<outer_blk>>
    DECLARE
        v_level VARCHAR2(10) := 'outer';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('start: ' || v_level);
        DECLARE
            v_level VARCHAR2(10) := 'inner';
        BEGIN
            DBMS_OUTPUT.PUT_LINE('inner sees: ' || v_level);
            DBMS_OUTPUT.PUT_LINE('outer via label: ' || outer_blk.v_level);
        END;
        DBMS_OUTPUT.PUT_LINE('back in outer: ' || v_level);
    END outer_blk;
END nested_block_scope_demo;
/
