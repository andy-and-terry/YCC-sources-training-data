CREATE OR REPLACE FUNCTION safe_divide(p_a IN NUMBER, p_b IN NUMBER) RETURN NUMBER IS
    custom_error EXCEPTION;
BEGIN
    IF p_b = 0 THEN
        RAISE custom_error;
    END IF;
    RETURN p_a / p_b;
EXCEPTION
    WHEN custom_error THEN
        DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');
        RETURN NULL;
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Zero divide error');
        RETURN NULL;
END safe_divide;
/
