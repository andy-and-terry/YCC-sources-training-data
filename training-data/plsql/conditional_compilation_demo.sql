-- Conditional compilation: code is chosen at compile time, not run time.
ALTER SESSION SET PLSQL_CCFLAGS = 'debug_on:TRUE, max_items:3';

CREATE OR REPLACE PROCEDURE conditional_compilation_demo IS
BEGIN
    $IF $$debug_on $THEN
        DBMS_OUTPUT.PUT_LINE('debug logging enabled');
    $END

    FOR i IN 1..$$max_items LOOP
        DBMS_OUTPUT.PUT_LINE('item ' || i);
    END LOOP;

    $IF DBMS_DB_VERSION.VER_LE_10 $THEN
        DBMS_OUTPUT.PUT_LINE('legacy database');
    $ELSE
        DBMS_OUTPUT.PUT_LINE('modern database');
    $END
END conditional_compilation_demo;
/
