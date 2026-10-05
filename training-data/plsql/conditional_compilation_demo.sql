ALTER SESSION SET PLSQL_CCFLAGS = 'debug_mode:TRUE, max_items:3';

DECLARE
    TYPE items_t IS VARRAY($$max_items) OF VARCHAR2(10);
    items items_t := items_t('a', 'b', 'c');
BEGIN
    $IF $$debug_mode $THEN
        DBMS_OUTPUT.PUT_LINE('debug: ' || items.COUNT || ' items');
    $ELSE
        NULL;
    $END
    $IF DBMS_DB_VERSION.VER_LE_11 $THEN
        DBMS_OUTPUT.PUT_LINE('old database');
    $ELSE
        DBMS_OUTPUT.PUT_LINE('modern database');
    $END
END;
/
