-- Dutch national flag: sort an array of 0s, 1s and 2s in place with a
-- single pass using three pointers (low, mid, high).
CREATE OR REPLACE TYPE flag_array_t AS TABLE OF NUMBER;
/

CREATE OR REPLACE PROCEDURE dutch_flag_sort(p_arr IN OUT NOCOPY flag_array_t) IS
    low  PLS_INTEGER := 1;
    mid  PLS_INTEGER := 1;
    high PLS_INTEGER := p_arr.COUNT;
    tmp  NUMBER;
BEGIN
    WHILE mid <= high LOOP
        CASE p_arr(mid)
            WHEN 0 THEN
                tmp := p_arr(low); p_arr(low) := p_arr(mid); p_arr(mid) := tmp;
                low := low + 1;
                mid := mid + 1;
            WHEN 1 THEN
                mid := mid + 1;
            WHEN 2 THEN
                tmp := p_arr(mid); p_arr(mid) := p_arr(high); p_arr(high) := tmp;
                high := high - 1;
            ELSE
                RAISE_APPLICATION_ERROR(-20010, 'value must be 0, 1 or 2');
        END CASE;
    END LOOP;
END dutch_flag_sort;
/

DECLARE
    v_arr   flag_array_t := flag_array_t(2, 0, 1, 2, 1, 0, 0, 2, 1);
    out_str VARCHAR2(200) := '';
BEGIN
    dutch_flag_sort(v_arr);
    FOR i IN 1..v_arr.COUNT LOOP
        out_str := out_str || v_arr(i);
        IF i < v_arr.COUNT THEN
            out_str := out_str || ',';
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(out_str);
END;
/
