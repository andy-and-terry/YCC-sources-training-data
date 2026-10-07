-- NESTED TABLE: an unbounded, sparse-after-DELETE collection type that
-- (unlike VARRAY) supports the MULTISET set operators and the SET/MEMBER
-- OF predicates for comparing two collections as bags/sets.
CREATE OR REPLACE TYPE number_list_t AS TABLE OF NUMBER;
/

CREATE OR REPLACE PROCEDURE nested_table_multiset_demo IS
    v_team_a number_list_t := number_list_t(1, 2, 3, 4);
    v_team_b number_list_t := number_list_t(3, 4, 5, 6);
    v_result number_list_t;
BEGIN
    v_result := SET(v_team_a MULTISET UNION v_team_b);
    DBMS_OUTPUT.PUT_LINE('union: ' || v_result.COUNT || ' members');

    v_result := v_team_a MULTISET INTERSECT v_team_b;
    FOR i IN 1..v_result.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('common member: ' || v_result(i));
    END LOOP;

    v_result := v_team_a MULTISET EXCEPT v_team_b;
    FOR i IN 1..v_result.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('only in team a: ' || v_result(i));
    END LOOP;

    IF 3 MEMBER OF v_team_a THEN
        DBMS_OUTPUT.PUT_LINE('3 is a member of team a');
    END IF;

    IF v_team_a IS NOT A SET THEN
        DBMS_OUTPUT.PUT_LINE('team a has no duplicates check: false branch unreachable here');
    ELSE
        DBMS_OUTPUT.PUT_LINE('team a has no duplicate elements');
    END IF;
END nested_table_multiset_demo;
/

BEGIN
    nested_table_multiset_demo;
END;
/
