SELECT p.product_names, SUM(s.amount) AS
 total_sales
FROM sales s 
LEFT JOIN products p
ON p.product_id = s.product_id
GROUP BY p.product_id , p.product_name
HAVING SUM(s.amount) > (SELECT AVG(total_sales)
FROM
 (SELECT s.product_id , SUM(s.amount) 
 AS total_sales
FROM sales 
GROUP BY s.product_id) AS avg_total_sales );
