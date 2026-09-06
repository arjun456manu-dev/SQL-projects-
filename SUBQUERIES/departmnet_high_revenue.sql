SELECT d.department_name , SUM(o.amount) AS total_revenue 
FROM departments d 
JOIN orders o 
ON o.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(o.amount) > 70000;