SELECT 
c.customer_id ,
c.customer_name,
COUNT(o.order_id) AS total_orders,
SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id 
 GROUP BY customer_id , customer_name
 HAVING COUNT(order_id) > 2 AND SUM(o.amount) > 6000; 
 
 
 
