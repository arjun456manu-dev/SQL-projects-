SELECT
    p.product_id,
    p.product_name,
    COUNT(s.sale_id) AS count_sales,
    AVG(s.amount) AS average_sale_amount
FROM products p
JOIN sales s
    ON p.product_id = s.product_id
WHERE s.amount >= 10000
GROUP BY p.product_id, p.product_name
HAVING COUNT(s.sale_id) >= 2
   AND AVG(s.amount) > (
       SELECT AVG(prod_avg)
       FROM (
           SELECT
               s2.product_id,
               AVG(s2.amount) AS prod_avg
           FROM sales s2
           WHERE s2.amount >= 10000
           GROUP BY s2.product_id
       ) AS avg_product
   );