-- Monotonic-stack next-greater-element scan.
CREATE OR REPLACE FUNCTION next_greater_elements(p_arr IN SYS.ODCINUMBERLIST) RETURN VARCHAR2 IS
    TYPE num_array IS TABLE OF NUMBER;
    result_ num_array := num_array();
    TYPE idx_stack IS TABLE OF NUMBER;
    stk idx_stack := idx_stack();
    out_line VARCHAR2(200) := '';
BEGIN
    FOR i IN 1..p_arr.COUNT LOOP
        result_.EXTEND;
        result_(i) := -1;
    END LOOP;
    FOR i IN 1..p_arr.COUNT LOOP
        WHILE stk.COUNT > 0 AND p_arr(stk(stk.COUNT)) < p_arr(i) LOOP
            result_(stk(stk.COUNT)) := p_arr(i);
            stk.TRIM;
        END LOOP;
        stk.EXTEND;
        stk(stk.COUNT) := i;
    END LOOP;
    FOR i IN 1..result_.COUNT LOOP
        out_line := out_line || result_(i) || ' ';
    END LOOP;
    RETURN out_line;
END next_greater_elements;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(next_greater_elements(SYS.ODCINUMBERLIST(2, 1, 2, 4, 3)));
END;
/
