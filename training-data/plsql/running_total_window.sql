-- Running total and 3-row moving average with analytic functions.
SELECT order_id,
       amount,
       SUM(amount) OVER (ORDER BY order_id) AS running_total,
       ROUND(AVG(amount) OVER (ORDER BY order_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg_3
FROM   orders
ORDER  BY order_id;
