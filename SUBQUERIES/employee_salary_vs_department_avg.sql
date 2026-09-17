SELECT 
    e.employee_name,
    e.employee_id,
    d.department_name,
    SUM(s.amount) AS total_sales
     FROM department d
    JOIN employees e
    ON e.department_id = d.department_id 
    JOIN sales s 
    ON e.employee_id = s.employee_id
    GROUP BY 
    e.employee_name,
    e.employee_id,
    d.department_name,
    d.department_id
    HAVING SUM(s.amount) = (
    SELECT
    MAX(employees_total)
    FROM (
    SELECT
     e2.employee_id , e2.department_id ,
     SUM(s2.amount) AS employee_total
     FROM employees e2
     JOIN sales s2
     ON e2.employee_id = s2.employee_id 
     WHERE e2.department_id = e.department_d 
     GROUP BY department_name, department_id) AS deapartment_employee_total);