SELECT c.customer_name , SUM(o.amount) 
AS total_spending
FROM customers c 
JOIN orders o 
ON c.customer_id = o.customer_id 
GROUP BY c.customer_name 
HAVING SUM(o.amount) > (SELECT AVG (total_spending) AS
avg_total_sepnding FROM (SELECT customer_id , SUM(amount) AS total_spending
FROM orders 
GROUP BY customer_id) AS customer_total);