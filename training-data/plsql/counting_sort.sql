-- Counting sort: non-comparison sort for integers in a known small range,
-- runs in O(n + k) using an INDEX BY table as the count buckets.
CREATE OR REPLACE TYPE int_array_t AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION counting_sort(p_arr IN int_array_t, p_max IN PLS_INTEGER) RETURN int_array_t IS
    TYPE count_table IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    counts count_table;
    result int_array_t := int_array_t();
    pos    PLS_INTEGER := 0;
BEGIN
    FOR i IN 0..p_max LOOP
        counts(i) := 0;
    END LOOP;
    FOR i IN 1..p_arr.COUNT LOOP
        counts(p_arr(i)) := counts(p_arr(i)) + 1;
    END LOOP;
    result.EXTEND(p_arr.COUNT);
    FOR v IN 0..p_max LOOP
        FOR occurrence IN 1..counts(v) LOOP
            pos := pos + 1;
            result(pos) := v;
        END LOOP;
    END LOOP;
    RETURN result;
END counting_sort;
/

DECLARE
    v_in    int_array_t := int_array_t(4, 2, 2, 8, 3, 3, 1, 0);
    v_out   int_array_t;
    out_str VARCHAR2(200) := '';
BEGIN
    v_out := counting_sort(v_in, 8);
    FOR i IN 1..v_out.COUNT LOOP
        out_str := out_str || v_out(i);
        IF i < v_out.COUNT THEN
            out_str := out_str || ',';
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(out_str);
END;
/
