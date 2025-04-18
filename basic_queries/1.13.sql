SELECT product_id,
       name,
       price as old_price,
       round(price*1.05, 1) as new_price
FROM   products
ORDER BY new_price desc, product_id