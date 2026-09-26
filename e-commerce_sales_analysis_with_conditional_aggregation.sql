SELECT 
c.customer_id, 
COUNT(CASE 
            WHEN o.status = 'Completed' THEN o.order_id
            END) AS completed_orders,
SUM(CASE  
           WHEN o.status = 'Completed'   THEN o.amount
           ELSE 0
           END) AS completed_spending ,
COUNT( CASE 
           WHEN o.status = 'Cancelled'  THEN o.order_id
           END) AS cancelled_orders
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name
HAVING COUNT (
        CASE 
            WHEN o.status = 'Completed' THEN o.order_id
            END) >= 2
AND 
SUM (
        CASE 
            WHEN o.status = 'Completed' THEN o.amount
            ELSE 0 
            END) > 10000
AND   COUNT(
       CASE 
            WHEN o.status = 'Cancelled'  THEN o.order_id
            END) > 1;
            
            