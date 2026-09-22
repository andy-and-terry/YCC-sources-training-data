-- Monotonic-stack next-greater-element: scan right to left, popping any
-- stacked value that is not greater than the current one before reading
-- the stack top as the answer, then push the current value.
CREATE OR REPLACE TYPE number_stack_t AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION next_greater_elements(p_values IN number_stack_t) RETURN number_stack_t IS
    result number_stack_t := number_stack_t();
    stack number_stack_t := number_stack_t();
BEGIN
    result.EXTEND(p_values.COUNT);

    FOR i IN REVERSE 1..p_values.COUNT LOOP
        WHILE stack.COUNT > 0 AND stack(stack.COUNT) <= p_values(i) LOOP
            stack.TRIM(1);
        END LOOP;

        IF stack.COUNT = 0 THEN
            result(i) := -1;
        ELSE
            result(i) := stack(stack.COUNT);
        END IF;

        stack.EXTEND;
        stack(stack.COUNT) := p_values(i);
    END LOOP;

    RETURN result;
END next_greater_elements;
/

DECLARE
    v_input  number_stack_t := number_stack_t(4, 5, 2, 10, 8);
    v_output number_stack_t;
    v_line   VARCHAR2(200) := '';
BEGIN
    v_output := next_greater_elements(v_input);
    FOR i IN 1..v_output.COUNT LOOP
        v_line := v_line || v_output(i);
        IF i < v_output.COUNT THEN
            v_line := v_line || ',';
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_line);
END;
/
