SELECT 
     d.department_name , 
     SUM(s.amount) as total_sales
FROM departments d
JOIN employees e
   ON e.department_id = d.department_id
JOIN sales s 
    ON e.employee_id = s.employee_id
GROUP BY d.departmnet_id ,d.department_name
HAVING SUM(s.amount) = (
SELECT MAX(total_sales)
FROM (
SELECT d.department_id ,SUM(s.amount) AS total_sales
FROM departments d 
JOIN employees e 
  ON e.department_id = d.departmnet_id
JOIN sales s 
  ON e.employee_id = s.employee_id
GROUP BY d.department_id , d.department_name) 
AS total_revenue
);