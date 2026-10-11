DECLARE
    TYPE name_tab IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    names name_tab;
    i     PLS_INTEGER;
BEGIN
    names(1) := 'alpha';
    names(3) := 'gamma';
    names(7) := 'eta';
    names(10) := 'kappa';

    DBMS_OUTPUT.PUT_LINE('exists(2): ' || CASE WHEN names.EXISTS(2) THEN 'yes' ELSE 'no' END);
    DBMS_OUTPUT.PUT_LINE('count=' || names.COUNT || ' first=' || names.FIRST || ' last=' || names.LAST);

    names.DELETE(3);
    names.DELETE(8, 10);
    i := names.FIRST;
    WHILE i IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE(i || ' => ' || names(i) || ' (next=' || NVL(TO_CHAR(names.NEXT(i)), 'none') || ')');
        i := names.NEXT(i);
    END LOOP;
END;
/
