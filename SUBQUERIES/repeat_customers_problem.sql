SELECT c.customer_name , COUNT(o.order_id) AS order_count
FROM customers c 
JOIN orders o 
ON o.customer_id = c.customer_id 
GROUP BY c.customer_name , c.customer_id
HAVING COUNT(order_id) > 1;