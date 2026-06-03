*Percentage of Users Attended a Contest*

*Solução:*

SELECT 
    r.contest_id,
    ROUND(COUNT(DISTINCT r.user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC;

*Como pensei:*  
Conto quantos usuários únicos tem em cada `contest_id` com `COUNT(DISTINCT user_id)`. Divido pelo total de usuários da tabela `Users` e multiplico por 100 pra ter a porcentagem. `ROUND` pra 2 casas. Ordeno pela porcentagem descendo e se empatar vai por `contest_id` crescendo.
