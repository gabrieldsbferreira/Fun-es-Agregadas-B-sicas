*Project Employees I*

*Solução:*

SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id;

*Como pensei:*  
Junto `Project` com `Employee` pelo `employee_id`. Agrupo por `project_id` e tiro a média de `experience_years` com `AVG`. Uso `ROUND` pra deixar com 2 casas decimais.
