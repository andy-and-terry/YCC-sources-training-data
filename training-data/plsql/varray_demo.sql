-- VARRAY: a bounded, dense collection type (unlike a nested table, its
-- maximum size is fixed at declaration and it always stays index-compact).
CREATE OR REPLACE TYPE week_temps_t AS VARRAY(10) OF NUMBER;
/

CREATE OR REPLACE PROCEDURE varray_demo IS
    v_temps week_temps_t := week_temps_t(68, 71, 75, 74, 69, 66, 70);
    v_total NUMBER := 0;
BEGIN
    FOR i IN 1..v_temps.COUNT LOOP
        v_total := v_total + v_temps(i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('average: ' || ROUND(v_total / v_temps.COUNT, 2));

    v_temps.EXTEND;
    v_temps(v_temps.COUNT) := 72;
    DBMS_OUTPUT.PUT_LINE('days recorded after extend: ' || v_temps.COUNT);

    BEGIN
        v_temps.EXTEND(10);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('cannot exceed VARRAY limit of 10: ' || SQLERRM);
    END;
END varray_demo;
/
