DECLARE
    d1 DATE := TO_DATE('2024-01-31', 'YYYY-MM-DD');
    d2 DATE := TO_DATE('2024-03-15 13:45:30', 'YYYY-MM-DD HH24:MI:SS');
BEGIN
    DBMS_OUTPUT.PUT_LINE('plus 10 days: ' || TO_CHAR(d1 + 10, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('add 1 month: ' || TO_CHAR(ADD_MONTHS(d1, 1), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('last day: ' || TO_CHAR(LAST_DAY(d1), 'DD'));
    DBMS_OUTPUT.PUT_LINE('days between: ' || TRUNC(d2 - d1));
    DBMS_OUTPUT.PUT_LINE('months between: ' || ROUND(MONTHS_BETWEEN(d2, d1), 2));
    DBMS_OUTPUT.PUT_LINE('next friday: ' || TO_CHAR(NEXT_DAY(d2, 'FRIDAY'), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('day name: ' || TRIM(TO_CHAR(d2, 'DAY')) || ', ' || TO_CHAR(d2, 'DDD') || 'th day of year');
    DBMS_OUTPUT.PUT_LINE('truncate to month: ' || TO_CHAR(TRUNC(d2, 'MM'), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('time part: ' || TO_CHAR(d2, 'HH12:MI AM'));
    DBMS_OUTPUT.PUT_LINE('interval: ' || TO_CHAR(NUMTODSINTERVAL(d2 - d1, 'DAY')));
END;
/
