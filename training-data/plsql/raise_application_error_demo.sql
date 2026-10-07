CREATE OR REPLACE PROCEDURE withdraw(p_balance IN OUT NUMBER, p_amount IN NUMBER) IS
BEGIN
    IF p_amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Amount must be positive');
    ELSIF p_amount > p_balance THEN
        RAISE_APPLICATION_ERROR(-20002, 'Insufficient funds: balance ' || p_balance);
    END IF;
    p_balance := p_balance - p_amount;
END withdraw;
/

DECLARE
    balance NUMBER := 100;
BEGIN
    withdraw(balance, 30);
    DBMS_OUTPUT.PUT_LINE('balance: ' || balance);
    withdraw(balance, 500);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('code ' || SQLCODE || ': ' || SQLERRM);
END;
/
