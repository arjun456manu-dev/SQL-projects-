SELECT
    d.department_id,
    d.department_name,
    COUNT(e.expense_id) AS expense_count,
    AVG(e.amount) AS department_average_expense
FROM departments d
JOIN expenses e
    ON e.department_id = d.department_id
WHERE e.amount >= 20000
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.expense_id) >= 2
   AND AVG(e.amount) > (
       SELECT AVG(avg_depart)
       FROM (
           SELECT
               e2.department_id,
               AVG(e2.amount) AS avg_depart
           FROM expenses e2
           WHERE e2.amount >= 20000
           GROUP BY e2.department_id
       ) AS avg_department
   );