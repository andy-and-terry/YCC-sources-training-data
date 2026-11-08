DECLARE
    s     VARCHAR2(30) := 'WEAREDISCOVERED';
    TYPE rows_t IS TABLE OF VARCHAR2(30) INDEX BY PLS_INTEGER;
    rows  rows_t;
    r     PLS_INTEGER := 0;
    dir   PLS_INTEGER := 1;
    res   VARCHAR2(30);
BEGIN
    FOR k IN 0 .. 2 LOOP rows(k) := ''; END LOOP;
    FOR i IN 1 .. LENGTH(s) LOOP
        rows(r) := rows(r) || SUBSTR(s, i, 1);
        IF r = 0 THEN dir := 1; END IF;
        IF r = 2 THEN dir := -1; END IF;
        r := r + dir;
    END LOOP;
    res := rows(0) || rows(1) || rows(2);
    DBMS_OUTPUT.PUT_LINE(res);
END;
/
