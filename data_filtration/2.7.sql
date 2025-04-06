SELECT product_id,
       name
FROM products
WHERE name like 'с%'
  AND name not like '% %'
ORDER BY product_id