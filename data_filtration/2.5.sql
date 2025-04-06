SELECT product_id,
       name
FROM products
WHERE split_part(name, ' ', 1) = 'чай'
  OR length(name) = 5
ORDER BY product_id