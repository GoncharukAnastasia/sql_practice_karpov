SELECT name AS product_name,
       price AS product_price
FROM products
ORDER BY product_price DESC
LIMIT 5