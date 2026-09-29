SELECT
    c.customer_name,
    COUNT(CASE
        WHEN o.status = 'Completed' THEN o.order_id
    END) AS completed_orders,

    SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) AS completed_revenue,

    AVG(CASE
        WHEN o.status = 'Completed' THEN o.amount
    END) AS avg_completed_order_value,

    COUNT(CASE
        WHEN o.status = 'Cancelled' THEN o.order_id
    END) AS cancelled_orders,

    SUM(CASE
        WHEN o.status = 'Cancelled' THEN o.amount
        ELSE 0
    END) AS cancelled_revenue

FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id

GROUP BY
    c.customer_id,
    c.customer_name

HAVING
    COUNT(CASE
        WHEN o.status = 'Completed' THEN o.order_id
    END) >= 3

    AND SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) > 20000

    AND AVG(CASE
        WHEN o.status = 'Completed' THEN o.amount
    END) > (
        SELECT AVG(customer_avg)
        FROM (
            SELECT
                o2.customer_id,
                AVG(CASE
                    WHEN o2.status = 'Completed' THEN o2.amount
                END) AS customer_avg
            FROM orders o2
            GROUP BY o2.customer_id
        ) AS customer_averages
    )

    AND COUNT(CASE
        WHEN o.status = 'Cancelled' THEN o.order_id
    END) >= 1

    AND SUM(CASE
        WHEN o.status = 'Cancelled' THEN o.amount
        ELSE 0
    END) < 5000;

         
          