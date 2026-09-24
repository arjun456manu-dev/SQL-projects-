SELECT
    c.customer_name,
    o.order_id,
    o.amount
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.amount > (
    SELECT AVG(o2.amount)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
);