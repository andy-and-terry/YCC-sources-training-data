CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE PACKAGE circular_buffer_pkg IS
    TYPE buf_state IS RECORD (
        data int_table,
        capacity NUMBER,
        buf_size NUMBER,
        start_idx NUMBER
    );
    FUNCTION new_buffer(p_capacity NUMBER) RETURN buf_state;
    FUNCTION push_value(buf IN buf_state, p_value NUMBER) RETURN buf_state;
END circular_buffer_pkg;
/

CREATE OR REPLACE PACKAGE BODY circular_buffer_pkg IS
    FUNCTION new_buffer(p_capacity NUMBER) RETURN buf_state IS
        result buf_state;
    BEGIN
        result.data := int_table();
        result.data.EXTEND(p_capacity);
        result.capacity := p_capacity;
        result.buf_size := 0;
        result.start_idx := 0;
        RETURN result;
    END new_buffer;

    FUNCTION push_value(buf IN buf_state, p_value NUMBER) RETURN buf_state IS
        result buf_state := buf;
        idx NUMBER;
    BEGIN
        idx := MOD(result.start_idx + result.buf_size, result.capacity) + 1;
        result.data(idx) := p_value;
        IF result.buf_size < result.capacity THEN
            result.buf_size := result.buf_size + 1;
        ELSE
            result.start_idx := MOD(result.start_idx + 1, result.capacity);
        END IF;
        RETURN result;
    END push_value;
END circular_buffer_pkg;
/
