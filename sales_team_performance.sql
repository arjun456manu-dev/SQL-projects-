SELECT
 e.employee_name,
COUNT(CASE 
         WHEN  s.status = 'Completed' THEN s.sale_id
         END) AS completed_sales,
SUM( CASE 
		WHEN s.status = 'Completed'  THEN s.amount
        ELSE 0 
        END) AS completed_spending,
COUNT(CASE 
         WHEN s.status = 'Cancelled'  THEN s.sale_id
         END) as cancelled_sales
FROM employees e 
JOIN sales s
ON e.employee_id = s.employee_id
WHERE e.department = 'Sales'
GROUP BY e.employee_id , e.employee_name
HAVING COUNT(CASE 
          WHEN s.status = 'Completed' THEN s.sale_id
          END) >= 2
AND
       SUM(CASE
         WHEN s.status = 'Completed' THEN s.amount
         ELSE 0 
         END)  >= 60000
AND    COUNT(CASE 
        WHEN s.status = 'Cancelled' THEN s.sale_id
        END) >= 1;
          