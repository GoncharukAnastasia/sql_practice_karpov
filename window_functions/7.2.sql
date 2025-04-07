SELECT product_id,
       name,
       price,
       max(price) OVER() max_price,
       round(price / max(price) OVER(), 2) share_of_max
FROM   products
ORDER BY 3 desc, 1