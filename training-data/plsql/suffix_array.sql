-- Naive suffix array: sorts starting indices by the suffix they head,
-- relying on PL/SQL's built-in string comparison for the sort key.
DECLARE
    TYPE idx_list IS TABLE OF NUMBER;
    text_val VARCHAR2(20) := 'banana';
    indices idx_list := idx_list();
    tmp NUMBER;
BEGIN
    FOR i IN 1..LENGTH(text_val) LOOP
        indices.EXTEND;
        indices(i) := i;
    END LOOP;

    FOR i IN 1..indices.COUNT - 1 LOOP
        FOR j IN 1..indices.COUNT - 1 - i + 1 LOOP
            IF SUBSTR(text_val, indices(j)) > SUBSTR(text_val, indices(j + 1)) THEN
                tmp := indices(j);
                indices(j) := indices(j + 1);
                indices(j + 1) := tmp;
            END IF;
        END LOOP;
    END LOOP;

    FOR i IN 1..indices.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(indices(i) - 1 || ': ' || SUBSTR(text_val, indices(i)));
    END LOOP;
END;
/
