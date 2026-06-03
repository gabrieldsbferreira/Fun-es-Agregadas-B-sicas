*Queries Quality and Percentage*

*Solução:*

SELECT 
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name;

*Como pensei:*  
`quality` é a média de `rating / position`, então faço `AVG(rating * 1.0 / position)` pra garantir decimal.  
`poor_query_percentage` é a qtd de `rating < 3` dividido pelo total de queries, vezes 100. Uso `SUM(CASE WHEN...)` pra contar só as ruins.  
Filtro `query_name IS NOT NULL` porque o problema ignora nome nulo. `ROUND` pra 2 casas.
