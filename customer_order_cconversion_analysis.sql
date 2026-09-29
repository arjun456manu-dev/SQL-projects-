SELECT 
c.customer_id , 
SUM(o.amount) AS total_revenue ,
COUNT ( CASE 
            WHEN o.status = 'Completed' THEN o.order_id
            END)  AS completed_orders ,
COUNT( CASE 
            WHEN o.status = 'Cancelled' THEN o.order_id
END) AS cancelled_orders,
SUM( CASE 
            WHEN o.status = 'Completed' THEN o.amount 
            ELSE 0 
            END)AS completed_revenue , 
SUM( CASE             
          WHEN o.status = 'Cancelled' THEN o.amount
          ELSE 0
          END) AS cancelled_revenue,
AVG ( CASE 
            WHEN o.status = 'Completed' THEN o.amount 
            END ) AS average_order_value ,  
SUM ( CASE 
         WHEN o.status = 'Completed' AND o.payment_method = 'UPI' THEN o.amount
         END) AS upi_completed_revenue,
         
COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name
HAVING COUNT(o.order_id) >= 5 
AND
        COUNT ( CASE 
            WHEN o.status = 'Completed' THEN o.order_id
            END)  >= 3
AND    
         SUM( CASE 
            WHEN o.status = 'Completed' THEN o.amount 
            END) > 30000
AND
        AVG ( CASE 
            WHEN o.status = 'Completed' THEN o.amount 
            END ) > 8000
AND             
         COUNT( CASE 
            WHEN o.status = 'Cancelled' THEN o.order_id
END)   >= 1

AND 
       COUNT ( CASE 
            WHEN o.status = 'Completed' AND o.payment_method = 'UPI' THEN o.order_id
            END) >=1
AND
      SUM ( CASE 
         WHEN o.status = 'Completed' AND o.payment_method = 'UPI' THEN o.amount
         END) >= 10000  
AND   
        SUM( CASE             
          WHEN o.status = 'Cancelled' THEN o.amount
          END) <  SUM(o.amount)*25/100 ;        
            
            
            
            
            
            