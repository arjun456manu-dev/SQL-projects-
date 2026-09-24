SELECT
    c.customer_name,
    COUNT(o.order_id) AS completed_orders,
    SUM(o.amount) AS total_spending,
    AVG(o.amount) AS avg_spending
FROM customers c
JOIN orders o
    ON o.customer_id = c.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_name, c.customer_id
HAVING COUNT(o.order_id) >= 3
   AND SUM(o.amount) > 15000
   AND AVG(o.amount) > (
       SELECT AVG(com_amt)
       FROM (
           SELECT
               o2.customer_id,
               AVG(o2.amount) AS com_amt
           FROM orders o2
           WHERE o2.status = 'Completed'
           GROUP BY o2.customer_id
       ) AS average_value
   );