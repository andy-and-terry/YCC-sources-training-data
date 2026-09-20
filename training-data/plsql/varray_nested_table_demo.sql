-- VARRAY is bounded and dense (has a fixed LIMIT); a nested table is
-- unbounded and can become sparse after DELETE(n), so it must be walked
-- with FIRST/LAST/EXISTS rather than a plain 1..COUNT loop.
DECLARE
    TYPE color_varray IS VARRAY(5) OF VARCHAR2(20);
    colors color_varray := color_varray('red', 'green', 'blue');

    TYPE score_table IS TABLE OF NUMBER;
    scores score_table := score_table(90, 75, 60, 40);
BEGIN
    colors.EXTEND;
    colors(colors.COUNT) := 'yellow';
    DBMS_OUTPUT.PUT_LINE('varray count: ' || colors.COUNT || ' (limit ' || colors.LIMIT || ')');
    FOR i IN 1..colors.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('color ' || i || ': ' || colors(i));
    END LOOP;

    scores.DELETE(3);
    DBMS_OUTPUT.PUT_LINE('nested table count after delete: ' || scores.COUNT);
    FOR i IN scores.FIRST..scores.LAST LOOP
        IF scores.EXISTS(i) THEN
            DBMS_OUTPUT.PUT_LINE('score ' || i || ': ' || scores(i));
        ELSE
            DBMS_OUTPUT.PUT_LINE('score ' || i || ': (deleted)');
        END IF;
    END LOOP;
END;
/
