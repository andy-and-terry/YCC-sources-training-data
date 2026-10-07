CREATE OR REPLACE PROCEDURE date_arithmetic_demo IS
    d1 DATE := DATE '2024-01-31';
    d2 DATE := DATE '2024-03-15';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Plus 10 days:   ' || TO_CHAR(d1 + 10, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Plus 1 month:   ' || TO_CHAR(ADD_MONTHS(d1, 1), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Days between:   ' || (d2 - d1));
    DBMS_OUTPUT.PUT_LINE('Months between: ' || ROUND(MONTHS_BETWEEN(d2, d1), 2));
    DBMS_OUTPUT.PUT_LINE('Last day:       ' || TO_CHAR(LAST_DAY(d1), 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Next Monday:    ' || TO_CHAR(NEXT_DAY(d1, 'MONDAY'), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Truncated:      ' || TO_CHAR(TRUNC(d2, 'MM'), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Interval:       ' || TO_CHAR(d1 + NUMTODSINTERVAL(36, 'HOUR') + 0, 'YYYY-MM-DD'));
END date_arithmetic_demo;
/
