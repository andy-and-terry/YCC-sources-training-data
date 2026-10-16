DECLARE
    v_d DATE := DATE '2024-02-14';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Last day of month: ' || TO_CHAR(LAST_DAY(v_d), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Next Monday:       ' || TO_CHAR(NEXT_DAY(v_d, 'MONDAY'), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('First of month:    ' || TO_CHAR(TRUNC(v_d, 'MM'), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Start of year:     ' || TO_CHAR(TRUNC(v_d, 'YYYY'), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Plus 3 months:     ' || TO_CHAR(ADD_MONTHS(v_d, 3), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Months to Jan 1:   ' || ROUND(MONTHS_BETWEEN(DATE '2025-01-01', v_d), 2));
    DBMS_OUTPUT.PUT_LINE('Day name:          ' || TRIM(TO_CHAR(v_d, 'DAY')));
END;
/
