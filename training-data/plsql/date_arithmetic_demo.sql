-- DATE arithmetic and the common date functions.
DECLARE
    v_start DATE := TO_DATE('2024-01-31', 'YYYY-MM-DD');
    v_end   DATE := TO_DATE('2024-03-15', 'YYYY-MM-DD');
BEGIN
    DBMS_OUTPUT.PUT_LINE('days between: ' || (v_end - v_start));
    DBMS_OUTPUT.PUT_LINE('plus 10 days: ' || TO_CHAR(v_start + 10, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('add 1 month: ' || TO_CHAR(ADD_MONTHS(v_start, 1), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('months between: ' || ROUND(MONTHS_BETWEEN(v_end, v_start), 2));
    DBMS_OUTPUT.PUT_LINE('last day: ' || TO_CHAR(LAST_DAY(v_start), 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('next monday: ' || TO_CHAR(NEXT_DAY(v_start, 'MONDAY'), 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('weekday: ' || TO_CHAR(v_start, 'Day'));
    DBMS_OUTPUT.PUT_LINE('month start: ' || TO_CHAR(TRUNC(v_end, 'MM'), 'YYYY-MM-DD'));
END;
/
