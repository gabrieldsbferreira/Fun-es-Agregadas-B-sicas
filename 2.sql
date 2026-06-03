*Average Selling Price*

*Solução:*

SELECT 
    p.product_id,
    ROUND(IFNULL(SUM(u.units * p.price) / SUM(u.units), 0), 2) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;

*Como pensei:*  
Junto `Prices` com `UnitsSold` pelo `product_id` e pela data da compra estar no período do preço. Faço `SUM(units * price)` pra ter o total vendido e divido por `SUM(units)` pra média. Uso `LEFT JOIN` + `IFNULL` pra produto sem venda virar 0. `ROUND` pra 2 casas.
