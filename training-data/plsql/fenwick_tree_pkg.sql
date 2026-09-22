CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE PACKAGE fenwick_pkg IS
    TYPE fenwick_state IS RECORD (
        tree int_table,
        size NUMBER
    );
    FUNCTION new_fenwick(p_size NUMBER) RETURN fenwick_state;
    FUNCTION update_fenwick(f IN fenwick_state, p_index NUMBER, p_delta NUMBER) RETURN fenwick_state;
    FUNCTION prefix_sum(f IN fenwick_state, p_index NUMBER) RETURN NUMBER;
    FUNCTION range_sum(f IN fenwick_state, p_left NUMBER, p_right NUMBER) RETURN NUMBER;
END fenwick_pkg;
/

CREATE OR REPLACE PACKAGE BODY fenwick_pkg IS
    FUNCTION new_fenwick(p_size NUMBER) RETURN fenwick_state IS
        result fenwick_state;
    BEGIN
        result.size := p_size;
        result.tree := int_table();
        result.tree.EXTEND(p_size + 1);
        FOR i IN 1..result.tree.COUNT LOOP
            result.tree(i) := 0;
        END LOOP;
        RETURN result;
    END new_fenwick;

    FUNCTION update_fenwick(f IN fenwick_state, p_index NUMBER, p_delta NUMBER) RETURN fenwick_state IS
        result fenwick_state := f;
        i NUMBER := p_index + 1;
    BEGIN
        WHILE i <= result.size LOOP
            result.tree(i + 1) := result.tree(i + 1) + p_delta;
            i := i + BITAND(i, -i);
        END LOOP;
        RETURN result;
    END update_fenwick;

    FUNCTION prefix_sum(f IN fenwick_state, p_index NUMBER) RETURN NUMBER IS
        total NUMBER := 0;
        i NUMBER := p_index + 1;
    BEGIN
        WHILE i > 0 LOOP
            total := total + f.tree(i + 1);
            i := i - BITAND(i, -i);
        END LOOP;
        RETURN total;
    END prefix_sum;

    FUNCTION range_sum(f IN fenwick_state, p_left NUMBER, p_right NUMBER) RETURN NUMBER IS
    BEGIN
        IF p_left > 0 THEN
            RETURN prefix_sum(f, p_right) - prefix_sum(f, p_left - 1);
        END IF;
        RETURN prefix_sum(f, p_right);
    END range_sum;
END fenwick_pkg;
/

DECLARE
    f fenwick_pkg.fenwick_state;
    values int_table := int_table(3, 2, -1, 6, 5, 4, -3, 3, 7, 2);
BEGIN
    f := fenwick_pkg.new_fenwick(values.COUNT);
    FOR i IN 1..values.COUNT LOOP
        f := fenwick_pkg.update_fenwick(f, i - 1, values(i));
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(fenwick_pkg.range_sum(f, 0, 9));
    DBMS_OUTPUT.PUT_LINE(fenwick_pkg.range_sum(f, 2, 5));
    f := fenwick_pkg.update_fenwick(f, 2, 10);
    DBMS_OUTPUT.PUT_LINE(fenwick_pkg.range_sum(f, 2, 5));
END;
/
