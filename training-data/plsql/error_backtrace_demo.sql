CREATE OR REPLACE PACKAGE backtrace_demo AS
    PROCEDURE run;
END backtrace_demo;
/

CREATE OR REPLACE PACKAGE BODY backtrace_demo AS

    PROCEDURE level3(p_value IN NUMBER) IS
        v_result NUMBER;
    BEGIN
        v_result := 100 / p_value;
        DBMS_OUTPUT.PUT_LINE('result ' || v_result);
    END level3;

    PROCEDURE level2(p_value IN NUMBER) IS
    BEGIN
        level3(p_value);
    END level2;

    PROCEDURE level1 IS
    BEGIN
        level2(0);
    END level1;

    PROCEDURE run IS
    BEGIN
        level1;
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('caught: ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE('--- error stack ---');
            DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
            DBMS_OUTPUT.PUT_LINE('--- backtrace (origin of the error) ---');
            DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
            DBMS_OUTPUT.PUT_LINE('--- call stack at handler ---');
            DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_CALL_STACK);
    END run;

END backtrace_demo;
/

BEGIN
    backtrace_demo.run;
END;
/

DROP PACKAGE backtrace_demo;
