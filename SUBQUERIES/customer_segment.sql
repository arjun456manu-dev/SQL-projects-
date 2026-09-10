SELECT 
     c.customer_name , COUNT(o.order_id) AS
     total_orders,
    SUM(o.amount) AS total_spending,
CASE
    WHEN SUM(o.amount) >= 7000 AND COUNT(order_id) >= 3 THEN "VIP"
    WHEN SUM(o.amount) >= 5000 OR COUNT(order_id) >= 3 THEN "potentiel"
    ELSE "regular"
END AS customer_segment
   FROM orders o 
   JOIN customers c
      ON o.customer_id = c.customer_id
GROUP BY c.customer_id , c.customer_name ;    