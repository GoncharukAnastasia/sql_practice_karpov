SELECT array_length(product_ids, 1) AS order_size,
       count(order_id) AS orders_count
FROM orders
WHERE to_char(creation_time, 'ID')::integer BETWEEN 1 AND 5
GROUP BY 1
HAVING count(order_id) > 2000
ORDER BY 1