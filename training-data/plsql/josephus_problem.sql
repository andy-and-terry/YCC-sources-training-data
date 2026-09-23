-- Josephus problem: n people stand in a circle, every k-th person is
-- eliminated until one survivor remains. Modeled with a nested table that
-- is compacted after each elimination so indices stay contiguous.
CREATE OR REPLACE TYPE people_t AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION josephus_survivor(p_n IN PLS_INTEGER, p_k IN PLS_INTEGER) RETURN NUMBER IS
    v_people people_t := people_t();
    v_idx    PLS_INTEGER := 0; -- 0-based position of the next elimination
BEGIN
    FOR i IN 1..p_n LOOP
        v_people.EXTEND;
        v_people(v_people.LAST) := i;
    END LOOP;

    WHILE v_people.COUNT > 1 LOOP
        v_idx := MOD(v_idx + p_k - 1, v_people.COUNT);
        v_people.DELETE(v_idx + 1);
        DECLARE
            v_compact people_t := people_t();
            v_scan    PLS_INTEGER := v_people.FIRST;
        BEGIN
            WHILE v_scan IS NOT NULL LOOP
                v_compact.EXTEND;
                v_compact(v_compact.LAST) := v_people(v_scan);
                v_scan := v_people.NEXT(v_scan);
            END LOOP;
            v_people := v_compact;
        END;
    END LOOP;
    RETURN v_people(v_people.FIRST);
END josephus_survivor;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('survivor: ' || josephus_survivor(7, 3));
END;
/
