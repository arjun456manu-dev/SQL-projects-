SELECT 
c.custommer_name,
SUM(o.amount) AS total_spending , 
COUNT(o.order_id) AS total_orders
FROM orders o 
LEFT JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_id , c.customer_name
HAVING COUNT(order_id) > 2 
AND SUM(o.amount) > (SELECT AVG(total_spending) 
FROM (SELECT customer_id , SUM(amount)
 AS total_spending
FROM orders 
GROUP BY customer_id) 
AS greater_thn_avg_spending
);
