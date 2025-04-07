SELECT product_id,
       name,
       price,
       max(price) OVER(ORDER BY price desc) max_price,
       min(price) OVER(ORDER BY price desc) min_price
FROM   products
ORDER BY 3 desc, 1