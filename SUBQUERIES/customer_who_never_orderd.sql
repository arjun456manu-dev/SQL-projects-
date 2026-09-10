USE projects;
SELECT c.customer_name,
c.customer_id 
FROM customers c
WHERE NOT EXISTS(
   SELECT o.order_id  
      FROM orders o 
      WHERE 
      o.customer_id = c.customer_id
      );