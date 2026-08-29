CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE PACKAGE stack_pkg IS
    TYPE stack_state IS RECORD (
        items int_table
    );
    FUNCTION new_stack RETURN stack_state;
    FUNCTION push_item(s IN stack_state, p_value NUMBER) RETURN stack_state;
    FUNCTION pop_item(s IN OUT NOCOPY stack_state) RETURN NUMBER;
END stack_pkg;
/

CREATE OR REPLACE PACKAGE BODY stack_pkg IS
    FUNCTION new_stack RETURN stack_state IS
        result stack_state;
    BEGIN
        result.items := int_table();
        RETURN result;
    END new_stack;

    FUNCTION push_item(s IN stack_state, p_value NUMBER) RETURN stack_state IS
        result stack_state := s;
    BEGIN
        result.items.EXTEND;
        result.items(result.items.COUNT) := p_value;
        RETURN result;
    END push_item;

    FUNCTION pop_item(s IN OUT NOCOPY stack_state) RETURN NUMBER IS
        top_val NUMBER;
    BEGIN
        top_val := s.items(s.items.COUNT);
        s.items.TRIM;
        RETURN top_val;
    END pop_item;
END stack_pkg;
/
