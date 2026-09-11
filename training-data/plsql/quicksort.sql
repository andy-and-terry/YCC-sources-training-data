CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE PROCEDURE quicksort(
    p_arr IN OUT NOCOPY int_table,
    p_low IN NUMBER,
    p_high IN NUMBER
) IS
    v_pivot NUMBER;
    v_i NUMBER;
    v_temp NUMBER;
BEGIN
    IF p_low < p_high THEN
        v_pivot := p_arr(p_high);
        v_i := p_low - 1;
        FOR j IN p_low..p_high - 1 LOOP
            IF p_arr(j) <= v_pivot THEN
                v_i := v_i + 1;
                v_temp := p_arr(v_i);
                p_arr(v_i) := p_arr(j);
                p_arr(j) := v_temp;
            END IF;
        END LOOP;
        v_temp := p_arr(v_i + 1);
        p_arr(v_i + 1) := p_arr(p_high);
        p_arr(p_high) := v_temp;

        quicksort(p_arr, p_low, v_i);
        quicksort(p_arr, v_i + 2, p_high);
    END IF;
END quicksort;
/

CREATE OR REPLACE PROCEDURE print_quicksorted IS
    v_data int_table := int_table(5, 3, 8, 1, 9, 2, 7);
BEGIN
    quicksort(v_data, 1, v_data.COUNT);
    FOR i IN 1..v_data.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(v_data(i));
    END LOOP;
END print_quicksorted;
/
