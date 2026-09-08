SELECT c.customer_id,SUM(o.amount) AS total_spending
FROM orders o 
LEFT JOIN customers c 
on o.customer_id = c.customer_id
GROUP BY  c.customer_id
HAVING SUM(o.amount) = (SELECT MAX(total_spending) FROM 
(SELECT customer_id , SUM(amount) AS total_spending
FROM orders 
GROUP BY customer_id) AS max_total_spending
);
