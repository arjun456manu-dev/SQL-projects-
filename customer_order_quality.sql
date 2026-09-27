SELECT 
c.customer_name , 
COUNT(o.order_id) AS total_orders ,
COUNT( CASE 
          WHEN o.status = 'Completed' THEN o.order_id 
          END) AS completed_orders,
COUNT( CASE 
          WHEN o.status = 'Cancelled' THEN o.order_id 
          END) AS cancelled_orders,
SUM( CASE 
          WHEN o.status = 'Completed' THEN o.amount
          ELSE 0
          END) AS completed_revenue,
SUM( CASE 
          WHEN o.status = 'Cancelled' THEN o.amount
          ELSE 0
          END) AS cancelled_revenue
FROM customers c 
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_name , c.customer_id
HAVING COUNT(o.order_id) >= 3 AND
COUNT( CASE 
          WHEN o.status = 'Completed' THEN o.order_id 
          END) >= 2 
AND
SUM( CASE 
          WHEN o.status = 'Completed' THEN o.amount
          ELSE 0
          END) > 15000
AND           
SUM( CASE 
          WHEN o.status = 'Cancelled' THEN o.amount
          ELSE 0
          END) < 5000;
          
          