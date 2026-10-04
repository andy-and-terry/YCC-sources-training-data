CREATE OR REPLACE PROCEDURE withdraw(p_balance IN NUMBER, p_amount IN NUMBER, p_new OUT NUMBER) IS
BEGIN
    IF p_amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Amount must be positive');
    ELSIF p_amount > p_balance THEN
        RAISE_APPLICATION_ERROR(-20002, 'Insufficient funds: balance ' || p_balance || ', requested ' || p_amount);
    END IF;
    p_new := p_balance - p_amount;
END;
/

DECLARE
    result NUMBER;
    TYPE num_list IS TABLE OF NUMBER;
    amounts num_list := num_list(30, -5, 500);
BEGIN
    FOR i IN 1 .. amounts.COUNT LOOP
        BEGIN
            withdraw(100, amounts(i), result);
            DBMS_OUTPUT.PUT_LINE('new balance: ' || result);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('error ' || SQLCODE || ': ' || SQLERRM);
        END;
    END LOOP;
END;
/
