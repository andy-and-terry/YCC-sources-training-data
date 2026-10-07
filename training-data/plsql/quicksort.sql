CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE PROCEDURE quicksort(arr IN OUT NOCOPY int_table, lo IN NUMBER, hi IN NUMBER) IS
    pivot NUMBER;
    i NUMBER;
    temp NUMBER;
BEGIN
    IF lo < hi THEN
        pivot := arr(hi);
        i := lo - 1;
        FOR j IN lo..hi - 1 LOOP
            IF arr(j) <= pivot THEN
                i := i + 1;
                temp := arr(i);
                arr(i) := arr(j);
                arr(j) := temp;
            END IF;
        END LOOP;
        temp := arr(i + 1);
        arr(i + 1) := arr(hi);
        arr(hi) := temp;

        quicksort(arr, lo, i);
        quicksort(arr, i + 2, hi);
    END IF;
END quicksort;
/

DECLARE
    arr int_table := int_table(5, 3, 8, 1, 9, 2);
    out_str VARCHAR2(200) := '';
BEGIN
    quicksort(arr, 1, arr.COUNT);
    FOR i IN 1..arr.COUNT LOOP
        out_str := out_str || arr(i);
        IF i < arr.COUNT THEN
            out_str := out_str || ' ';
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(out_str);
END;
/
