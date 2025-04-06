SELECT count(order_id) as orders
FROM   orders
WHERE  array_length(product_ids, 1) >= 9