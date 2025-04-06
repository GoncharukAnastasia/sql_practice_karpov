SELECT product_id,
       name,
       price,
       round(price/120*20, 2) AS tax,
       round(price*100/120, 2) AS price_before_tax
FROM products
ORDER BY price_before_tax DESC,
         product_id