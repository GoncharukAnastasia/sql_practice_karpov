SELECT product_id,
       name,
       price,
       round(avg(price) OVER(), 2) avg_price,
       round(avg(price) filter (WHERE price != (SELECT max(price)
                                         FROM   products))
OVER(), 2) as avg_price_filtered
FROM   products
ORDER BY 3 desc, 1