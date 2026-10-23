DECLARE
    CURSOR c_sales IS
        WITH monthly AS (
            SELECT LEVEL AS month_no,
                   100 + MOD(LEVEL * 37, 50) AS amount
            FROM dual
            CONNECT BY LEVEL <= 6
        )
        SELECT month_no,
               amount,
               LAG(amount, 1)  OVER (ORDER BY month_no) AS prev_amount,
               LEAD(amount, 1) OVER (ORDER BY month_no) AS next_amount,
               amount - LAG(amount, 1, amount) OVER (ORDER BY month_no) AS change,
               SUM(amount) OVER (ORDER BY month_no) AS running_total,
               RANK() OVER (ORDER BY amount DESC) AS amount_rank
        FROM monthly
        ORDER BY month_no;
BEGIN
    FOR r IN c_sales LOOP
        DBMS_OUTPUT.PUT_LINE(
            'month ' || r.month_no ||
            ' amount=' || r.amount ||
            ' prev=' || NVL(TO_CHAR(r.prev_amount), '-') ||
            ' next=' || NVL(TO_CHAR(r.next_amount), '-') ||
            ' change=' || r.change ||
            ' running=' || r.running_total ||
            ' rank=' || r.amount_rank);
    END LOOP;
END;
/
