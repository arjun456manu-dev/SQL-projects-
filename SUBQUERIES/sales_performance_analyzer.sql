SELECT 
d.department_name ,
d.department_id,
 
SUM(s.amount) AS total_sales
FROM department d 
JOIN employees e
ON e.department_id = d.department_id
JOIN sales s 
ON e.employee_id = s.employee_id
GROUP BY 
d.department_id,
d.departmnet_name
HAVING SUM(s.amount) > (SELECT AVG(department_total)
FROM (SELECT  d2.department_id ,
SUM(s2.amount) AS department_total 
FROM departments d2
JOIN employees e2
ON e2.department_id = d2.department_id
JOIN sales s2
ON e2.employee_id = s2.employee_id
GROUP BY d2.department_id) AS departments_total);