-- A singly linked list encoded without pointers: each node lives at an
-- integer slot in two parallel associative arrays (value, next slot),
-- since PL/SQL has no native pointer/reference type.
CREATE OR REPLACE PACKAGE linked_list_pkg IS
    PROCEDURE reset_list;
    PROCEDURE push_front(p_value IN NUMBER);
    PROCEDURE push_back(p_value IN NUMBER);
    FUNCTION to_csv RETURN VARCHAR2;
END linked_list_pkg;
/

CREATE OR REPLACE PACKAGE BODY linked_list_pkg IS
    TYPE slot_values IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE slot_links IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;

    value_of slot_values;
    next_of slot_links;
    head_slot PLS_INTEGER;
    tail_slot PLS_INTEGER;
    next_free PLS_INTEGER := 1;

    PROCEDURE reset_list IS
    BEGIN
        value_of.DELETE;
        next_of.DELETE;
        head_slot := NULL;
        tail_slot := NULL;
        next_free := 1;
    END reset_list;

    PROCEDURE push_front(p_value IN NUMBER) IS
        slot PLS_INTEGER := next_free;
    BEGIN
        next_free := next_free + 1;
        value_of(slot) := p_value;
        next_of(slot) := head_slot;
        head_slot := slot;
        IF tail_slot IS NULL THEN
            tail_slot := slot;
        END IF;
    END push_front;

    PROCEDURE push_back(p_value IN NUMBER) IS
        slot PLS_INTEGER := next_free;
    BEGIN
        next_free := next_free + 1;
        value_of(slot) := p_value;
        next_of(slot) := NULL;
        IF tail_slot IS NULL THEN
            head_slot := slot;
            tail_slot := slot;
        ELSE
            next_of(tail_slot) := slot;
            tail_slot := slot;
        END IF;
    END push_back;

    FUNCTION to_csv RETURN VARCHAR2 IS
        result VARCHAR2(4000);
        cur PLS_INTEGER := head_slot;
        is_first BOOLEAN := TRUE;
    BEGIN
        WHILE cur IS NOT NULL LOOP
            IF is_first THEN
                result := TO_CHAR(value_of(cur));
                is_first := FALSE;
            ELSE
                result := result || ',' || value_of(cur);
            END IF;
            cur := next_of(cur);
        END LOOP;
        RETURN result;
    END to_csv;
END linked_list_pkg;
/

BEGIN
    linked_list_pkg.reset_list;
    linked_list_pkg.push_back(2);
    linked_list_pkg.push_back(3);
    linked_list_pkg.push_front(1);
    linked_list_pkg.push_back(4);
    DBMS_OUTPUT.PUT_LINE(linked_list_pkg.to_csv);
END;
/
