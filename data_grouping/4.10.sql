SELECT array_length(product_ids, 1) as order_size,
       count(order_id) as orders_count
FROM   orders
WHERE  creation_time between '2022-08-29 00:00:00'
   and '2022-09-05 00:00:00'
GROUP BY 1
ORDER BY 1