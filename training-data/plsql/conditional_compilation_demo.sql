ALTER SESSION SET PLSQL_CCFLAGS = 'debug_mode:TRUE, level_cap:3';

CREATE OR REPLACE PROCEDURE conditional_compilation_demo IS
BEGIN
    $IF $$debug_mode $THEN
        DBMS_OUTPUT.PUT_LINE('Debug build, level cap = ' || $$level_cap);
    $ELSE
        DBMS_OUTPUT.PUT_LINE('Release build');
    $END

    $IF DBMS_DB_VERSION.VER_LE_10 $THEN
        DBMS_OUTPUT.PUT_LINE('Oracle 10g or older');
    $ELSE
        DBMS_OUTPUT.PUT_LINE('Oracle 11g or newer');
    $END
END conditional_compilation_demo;
/
