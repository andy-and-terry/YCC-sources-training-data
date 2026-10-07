-- Associative arrays (INDEX BY tables): one keyed by PLS_INTEGER with
-- sparse, arbitrary numeric keys, and one keyed by VARCHAR2 acting as a
-- simple string-keyed map. Both use FIRST/NEXT/EXISTS for traversal.
DECLARE
    TYPE score_by_id_t   IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE score_by_name_t IS TABLE OF NUMBER INDEX BY VARCHAR2(30);

    v_by_id   score_by_id_t;
    v_by_name score_by_name_t;
    v_name    VARCHAR2(30);
BEGIN
    v_by_id(101) := 88;
    v_by_id(205) := 91;
    v_by_id(7)   := 76;

    FOR i IN v_by_id.FIRST..v_by_id.LAST LOOP
        IF v_by_id.EXISTS(i) THEN
            DBMS_OUTPUT.PUT_LINE('id ' || i || ' scored ' || v_by_id(i));
        END IF;
    END LOOP;

    v_by_name('alice') := 88;
    v_by_name('bob')   := 76;
    v_by_name('carol') := 91;

    v_name := v_by_name.FIRST;
    WHILE v_name IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE(v_name || ' -> ' || v_by_name(v_name));
        v_name := v_by_name.NEXT(v_name);
    END LOOP;
END;
/
