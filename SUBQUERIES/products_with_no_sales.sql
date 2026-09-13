SELECT 
p.product_name ,
p.product_id
FROM products p 

  WHERE NOT EXISTS (
SELECT 
    s.sales_id FROM 
    sales s 
        WHERE p.product_id = s.product_id
);