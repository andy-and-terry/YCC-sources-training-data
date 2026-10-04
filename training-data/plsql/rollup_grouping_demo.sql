CREATE TABLE orders_summary (
    region VARCHAR2(10),
    product VARCHAR2(10),
    amount NUMBER
);

INSERT INTO orders_summary VALUES ('East', 'Pen', 10);
INSERT INTO orders_summary VALUES ('East', 'Ink', 25);
INSERT INTO orders_summary VALUES ('West', 'Pen', 15);
INSERT INTO orders_summary VALUES ('West', 'Ink', 5);
INSERT INTO orders_summary VALUES ('West', 'Pad', 40);

BEGIN
    FOR rec IN (
        SELECT CASE WHEN GROUPING(region) = 1 THEN 'ALL' ELSE region END AS region,
               CASE WHEN GROUPING(product) = 1 THEN 'ALL' ELSE product END AS product,
               SUM(amount) AS total
        FROM orders_summary
        GROUP BY ROLLUP (region, product)
        ORDER BY GROUPING(region), region, GROUPING(product), product
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(rec.region, 6) || RPAD(rec.product, 6) || rec.total);
    END LOOP;
END;
/
