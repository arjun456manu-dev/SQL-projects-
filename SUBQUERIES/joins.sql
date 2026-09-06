SELECT o.customer_id , c.customer_name
FROM customers c
LEFT JOIN orders o  
ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;