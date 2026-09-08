SELECT c.customer_name , SUM(o.amount) AS total
FROM orders o 
LEFT JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name , o.customer_id
HAVING SUM(o.amount) > (SELECT AVG(total) FROM (
SELECT customer_id ,SUM(amount) AS total FROM orders
GROUP BY customer_id )
AS avgerage_total_spending
);