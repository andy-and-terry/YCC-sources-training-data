DECLARE
    PROCEDURE withdraw(p_balance NUMBER, p_amount NUMBER) IS
    BEGIN
        IF p_amount <= 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Amount must be positive');
        ELSIF p_amount > p_balance THEN
            RAISE_APPLICATION_ERROR(-20002, 'Insufficient funds');
        END IF;
        DBMS_OUTPUT.PUT_LINE('ok, new balance ' || (p_balance - p_amount));
    END;
BEGIN
    withdraw(100, 30);
    withdraw(100, 500);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SQLCODE=' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
