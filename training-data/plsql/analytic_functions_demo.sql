CREATE TABLE sales_data (
    region VARCHAR2(20),
    amount NUMBER
);

INSERT INTO sales_data VALUES ('East', 100);
INSERT INTO sales_data VALUES ('East', 250);
INSERT INTO sales_data VALUES ('West', 150);
INSERT INTO sales_data VALUES ('West', 300);
INSERT INTO sales_data VALUES ('West', 300);

CREATE OR REPLACE PROCEDURE print_sales_ranks IS
BEGIN
    FOR rec IN (
        SELECT region,
               amount,
               RANK() OVER (PARTITION BY region ORDER BY amount DESC) AS rnk,
               LAG(amount) OVER (PARTITION BY region ORDER BY amount) AS prev_amount
        FROM sales_data
        ORDER BY region, rnk
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            rec.region || ': ' || rec.amount ||
            ' (rank ' || rec.rnk || ', prev ' || NVL(TO_CHAR(rec.prev_amount), 'none') || ')'
        );
    END LOOP;
END print_sales_ranks;
/
