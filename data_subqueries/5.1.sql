SELECT product_id,
       name,
       price
FROM   products
WHERE  price >= (SELECT avg(price)
                 FROM   products) + 20
ORDER BY product_id desc