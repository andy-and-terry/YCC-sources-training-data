CREATE TABLE quarterly_sales (
    product VARCHAR2(10),
    quarter VARCHAR2(2),
    amount NUMBER
);

INSERT INTO quarterly_sales VALUES ('Pen', 'Q1', 100);
INSERT INTO quarterly_sales VALUES ('Pen', 'Q2', 120);
INSERT INTO quarterly_sales VALUES ('Ink', 'Q1', 80);
INSERT INTO quarterly_sales VALUES ('Ink', 'Q3', 95);

BEGIN
    DBMS_OUTPUT.PUT_LINE('-- pivot --');
    FOR rec IN (
        SELECT *
        FROM quarterly_sales
        PIVOT (SUM(amount) FOR quarter IN ('Q1' AS q1, 'Q2' AS q2, 'Q3' AS q3))
        ORDER BY product
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.product || ': ' || NVL(TO_CHAR(rec.q1), '-') || ' ' ||
                             NVL(TO_CHAR(rec.q2), '-') || ' ' || NVL(TO_CHAR(rec.q3), '-'));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('-- unpivot --');
    FOR rec IN (
        SELECT product, quarter, amount
        FROM (
            SELECT product,
                   SUM(CASE WHEN quarter = 'Q1' THEN amount END) AS q1,
                   SUM(CASE WHEN quarter = 'Q2' THEN amount END) AS q2
            FROM quarterly_sales
            GROUP BY product
        )
        UNPIVOT (amount FOR quarter IN (q1 AS 'first', q2 AS 'second'))
        ORDER BY product, quarter
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.product || ' ' || rec.quarter || ' ' || rec.amount);
    END LOOP;
END;
/
