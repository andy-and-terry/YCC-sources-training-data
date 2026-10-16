DECLARE
    v_total NUMBER := 0;

    PROCEDURE add_tax(p_amount IN OUT NUMBER, p_rate NUMBER := 0.2) IS
        FUNCTION tax_for(a NUMBER) RETURN NUMBER IS
        BEGIN
            RETURN ROUND(a * p_rate, 2);
        END;
    BEGIN
        p_amount := p_amount + tax_for(p_amount);
    END;
BEGIN
    v_total := 100;
    add_tax(v_total);
    DBMS_OUTPUT.PUT_LINE('default rate: ' || v_total);
    v_total := 100;
    add_tax(v_total, 0.07);
    DBMS_OUTPUT.PUT_LINE('7% rate:      ' || v_total);
END;
/
