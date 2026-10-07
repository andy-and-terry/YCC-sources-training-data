CREATE TABLE sales (
    salesperson VARCHAR2(20),
    region VARCHAR2(20),
    amount NUMBER
);

INSERT INTO sales VALUES ('Ann', 'East', 100);
INSERT INTO sales VALUES ('Bob', 'East', 150);
INSERT INTO sales VALUES ('Cleo', 'East', 90);
INSERT INTO sales VALUES ('Dan', 'West', 200);
INSERT INTO sales VALUES ('Eve', 'West', 120);

BEGIN
    FOR rec IN (
        SELECT
            salesperson,
            region,
            amount,
            RANK() OVER (PARTITION BY region ORDER BY amount DESC) AS region_rank,
            SUM(amount) OVER (PARTITION BY region) AS region_total,
            ROUND(amount / SUM(amount) OVER () * 100, 1) AS pct_of_all
        FROM sales
        ORDER BY region, region_rank
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.region || ' ' || rec.salesperson || ': rank ' || rec.region_rank ||
                              ', region total ' || rec.region_total || ', ' || rec.pct_of_all || '% of all sales');
    END LOOP;
END;
/
