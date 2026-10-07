-- PRAGMA EXCEPTION_INIT binds a named exception to a specific Oracle
-- error number so it can be caught by name instead of a generic OTHERS
-- handler that checks SQLCODE.
DECLARE
    insufficient_funds EXCEPTION;
    PRAGMA EXCEPTION_INIT(insufficient_funds, -20050);

    PROCEDURE withdraw(p_balance IN NUMBER, p_amount IN NUMBER) IS
    BEGIN
        IF p_amount > p_balance THEN
            RAISE_APPLICATION_ERROR(-20050, 'insufficient funds');
        END IF;
        DBMS_OUTPUT.PUT_LINE('withdrew ' || p_amount || ', remaining ' || (p_balance - p_amount));
    END withdraw;
BEGIN
    withdraw(100, 40);
    withdraw(100, 150);
EXCEPTION
    WHEN insufficient_funds THEN
        DBMS_OUTPUT.PUT_LINE('caught by name: ' || SQLERRM);
END;
/
