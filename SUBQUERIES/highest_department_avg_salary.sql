SELECT e.employee_name, AVG(e.salary)
 AS avg_salary
FROM employees e  
LEFT JOIN department d 
ON e.department_id = d.departmnet_id
GROUP BY d.department_id , d.department_name
      HAVING AVG(e.salary) = 
(SELECT MAX(avg_salary) FROM(
    SELECT departmnet_id ,employee_name_name,
    AVG(salary) AS avg_salary FROM employees
GROUP BY department_id ) 
AS departmnets_avg
);                        
