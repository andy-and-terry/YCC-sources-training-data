CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION quickselect(arr IN int_table, k IN NUMBER) RETURN NUMBER IS
    pivot NUMBER;
    lows int_table := int_table();
    highs int_table := int_table();
    pivots int_table := int_table();
BEGIN
    IF arr.COUNT = 1 THEN
        RETURN arr(1);
    END IF;

    pivot := arr(TRUNC(arr.COUNT / 2) + 1);

    FOR i IN 1..arr.COUNT LOOP
        IF arr(i) < pivot THEN
            lows.EXTEND;
            lows(lows.COUNT) := arr(i);
        ELSIF arr(i) > pivot THEN
            highs.EXTEND;
            highs(highs.COUNT) := arr(i);
        ELSE
            pivots.EXTEND;
            pivots(pivots.COUNT) := arr(i);
        END IF;
    END LOOP;

    IF k < lows.COUNT THEN
        RETURN quickselect(lows, k);
    ELSIF k < lows.COUNT + pivots.COUNT THEN
        RETURN pivot;
    ELSE
        RETURN quickselect(highs, k - lows.COUNT - pivots.COUNT);
    END IF;
END quickselect;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(quickselect(int_table(7, 10, 4, 3, 20, 15), 0));
    DBMS_OUTPUT.PUT_LINE(quickselect(int_table(7, 10, 4, 3, 20, 15), 2));
    DBMS_OUTPUT.PUT_LINE(quickselect(int_table(7, 10, 4, 3, 20, 15), 5));
END;
/
