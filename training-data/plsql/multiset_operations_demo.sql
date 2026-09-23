-- MULTISET operators combine two nested tables of the same SQL collection
-- type: UNION, INTERSECT, EXCEPT, plus the SUBMULTISET OF and IS A SET
-- conditions.
CREATE OR REPLACE TYPE number_set_t AS TABLE OF NUMBER;
/

DECLARE
    v_a         number_set_t := number_set_t(1, 2, 3, 4, 5);
    v_b         number_set_t := number_set_t(4, 5, 6, 7);
    v_union     number_set_t;
    v_intersect number_set_t;
    v_except    number_set_t;

    PROCEDURE print_set(p_label IN VARCHAR2, p_set IN number_set_t) IS
        v_out VARCHAR2(200) := p_label || ': ';
    BEGIN
        FOR i IN 1..p_set.COUNT LOOP
            v_out := v_out || p_set(i);
            IF i < p_set.COUNT THEN
                v_out := v_out || ',';
            END IF;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(v_out);
    END print_set;
BEGIN
    v_union     := v_a MULTISET UNION DISTINCT v_b;
    v_intersect := v_a MULTISET INTERSECT v_b;
    v_except    := v_a MULTISET EXCEPT v_b;

    print_set('union (distinct)', v_union);
    print_set('intersect', v_intersect);
    print_set('except (a minus b)', v_except);

    DBMS_OUTPUT.PUT_LINE('a submultiset of union: ' ||
        CASE WHEN v_a SUBMULTISET OF v_union THEN 'Y' ELSE 'N' END);
    DBMS_OUTPUT.PUT_LINE('a is a set (no dupes): ' ||
        CASE WHEN v_a IS A SET THEN 'Y' ELSE 'N' END);
END;
/
