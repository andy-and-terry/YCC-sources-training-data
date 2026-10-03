-- PIVOT turns row values into columns; UNPIVOT reverses that.
CREATE TABLE quarterly_sales (
    region VARCHAR2(20),
    quarter VARCHAR2(2),
    amount NUMBER
);

INSERT INTO quarterly_sales VALUES ('East', 'Q1', 100);
INSERT INTO quarterly_sales VALUES ('East', 'Q2', 150);
INSERT INTO quarterly_sales VALUES ('West', 'Q1', 200);
INSERT INTO quarterly_sales VALUES ('West', 'Q2', 180);

SELECT *
FROM quarterly_sales
PIVOT (
    SUM(amount)
    FOR quarter IN ('Q1' AS q1_total, 'Q2' AS q2_total)
);

CREATE TABLE sales_pivoted (
    region VARCHAR2(20),
    q1_total NUMBER,
    q2_total NUMBER
);

INSERT INTO sales_pivoted VALUES ('East', 100, 150);
INSERT INTO sales_pivoted VALUES ('West', 200, 180);

SELECT *
FROM sales_pivoted
UNPIVOT (
    amount FOR quarter IN (q1_total AS 'Q1', q2_total AS 'Q2')
);
