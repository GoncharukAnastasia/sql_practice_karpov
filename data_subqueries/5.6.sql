SELECT product_id,
       name,
       price,
       round(case when price >= (SELECT avg(price)
                          FROM   products) + 50 then price * 0.85 when price <= (SELECT avg(price)
                                                       FROM   products) -50 then price * 0.90 else price end, 2) as new_price
FROM   products
ORDER BY 3 desc, 1