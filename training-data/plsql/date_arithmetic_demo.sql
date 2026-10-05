DECLARE
    d1 DATE := TO_DATE('2024-02-27', 'YYYY-MM-DD');
    d2 DATE := TO_DATE('2024-12-25', 'YYYY-MM-DD');
BEGIN
    DBMS_OUTPUT.PUT_LINE('days between: ' || (d2 - d1));
    DBMS_OUTPUT.PUT_LINE('plus 3 days: ' || TO_CHAR(d1 + 3, 'YYYY-MM-DD DY'));
    DBMS_OUTPUT.PUT_LINE('add 1 month: ' || TO_CHAR(ADD_MONTHS(d1, 1), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('month end: ' || TO_CHAR(LAST_DAY(d1), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('months between: ' || ROUND(MONTHS_BETWEEN(d2, d1), 2));
    DBMS_OUTPUT.PUT_LINE('next monday: ' || TO_CHAR(NEXT_DAY(d1, 'MONDAY'), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('truncated to month: ' || TO_CHAR(TRUNC(d2, 'MM'), 'YYYY-MM-DD'));
END;
/
