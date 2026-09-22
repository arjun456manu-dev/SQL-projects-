SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS total_employee,
    AVG(e.salary) AS department_average_salary
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
WHERE e.salary >= 50000
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) >= 2
   AND AVG(e.salary) > (
       SELECT AVG(department_average)
       FROM (
           SELECT
               e2.department_id,
               AVG(e2.salary) AS department_average
           FROM employees e2
           WHERE e2.salary >= 50000
           GROUP BY e2.department_id
       ) AS department_averages
   );