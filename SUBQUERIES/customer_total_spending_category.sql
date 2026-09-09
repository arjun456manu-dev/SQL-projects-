SELECT
 c.customers_name ,
 SUM( o.amount)
 AS total_spending, 
CASE
       WHEN SUM(o.amount) >= 7000 THEN 'vip'
       WHEN SUM(o.amount) >= 5000 THEN 'premium'
       ELSE 'regular'
END AS category_customer

FROM customers c  
JOIN orders o
      ON o.customer_id = c.customer_id
GROUP BY c.customer_name , c.customer_id; 

