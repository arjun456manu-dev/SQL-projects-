SELECT 
    c.customer_name,
    SUM(o.amount) AS total_spending,
    COUNT(o.order_id) AS count_orders
FROM customers c
JOIN orders o
    ON o.customer_id = c.customer_id
WHERE o.amount >= 2000
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) >= 2
   AND SUM(o.amount) > (
       SELECT AVG(total_spending)
       FROM (
           SELECT
               o2.customer_id,
               SUM(o2.amount) AS total_spending
           FROM orders o2
           WHERE o2.amount >= 2000
           GROUP BY o2.customer_id
       ) AS customer_totals
   );

