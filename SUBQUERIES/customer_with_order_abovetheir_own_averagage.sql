SELECT 
c.customer_id , c.customer_name , o.order_id , o.amount
 FROM customers c
 JOIN orders o
 ON o.customer_id = c.customer_id
    WHERE EXISTS (SELECT o.order_id , o.amount
 FROM orders o
    WHERE o.customer_id = c.customer_id
    AND
o.amount > 
(SELECT AVG(o2.amount) FROM
 orders o2
    WHERE o2.customer_id = c.customer_id)

    );