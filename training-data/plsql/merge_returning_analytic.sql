CREATE TABLE inv (sku VARCHAR2(10) PRIMARY KEY, qty NUMBER);
INSERT INTO inv VALUES ('a', 5);
MERGE INTO inv t
USING (SELECT 'a' sku, 3 qty FROM dual UNION ALL SELECT 'b', 7 FROM dual) s
ON (t.sku = s.sku)
WHEN MATCHED THEN UPDATE SET t.qty = t.qty + s.qty
WHEN NOT MATCHED THEN INSERT (sku, qty) VALUES (s.sku, s.qty);
DECLARE v_qty NUMBER;
BEGIN
    UPDATE inv SET qty = qty * 2 WHERE sku = 'a' RETURNING qty INTO v_qty;
    DBMS_OUTPUT.PUT_LINE('new qty ' || v_qty);
END;
/
SELECT sku, qty,
       SUM(qty) OVER (ORDER BY sku) AS running,
       RANK() OVER (ORDER BY qty DESC) AS rnk,
       LAG(qty) OVER (ORDER BY sku) AS prev,
       ROUND(RATIO_TO_REPORT(qty) OVER (), 2) AS share
FROM inv;
