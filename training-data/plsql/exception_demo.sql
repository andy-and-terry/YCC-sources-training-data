CREATE OR REPLACE FUNCTION safe_divide(a IN NUMBER, b IN NUMBER) RETURN NUMBER IS
BEGIN
    RETURN a / b;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('error: division by zero');
        RETURN NULL;
END safe_divide;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(safe_divide(10, 2));
    DBMS_OUTPUT.PUT_LINE(safe_divide(5, 0));
END;
/
