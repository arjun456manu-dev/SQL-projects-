SELECT
    e.employee_name,
    e.employee_id,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);
