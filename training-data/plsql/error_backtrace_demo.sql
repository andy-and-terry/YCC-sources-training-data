CREATE OR REPLACE PROCEDURE level_three IS
    v_num NUMBER;
BEGIN
    v_num := 10 / 0;
END level_three;
/

CREATE OR REPLACE PROCEDURE level_two IS
BEGIN
    level_three;
END level_two;
/

CREATE OR REPLACE PROCEDURE level_one IS
BEGIN
    level_two;
END level_one;
/

BEGIN
    level_one;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Backtrace:');
        DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        DBMS_OUTPUT.PUT_LINE('Call stack:');
        DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_CALL_STACK);
END;
/
