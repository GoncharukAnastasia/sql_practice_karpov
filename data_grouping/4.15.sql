SELECT CASE
           WHEN array_length(product_ids, 1) IN (1,
                                                 2,
                                                 3) THEN 'Малый'
           WHEN array_length(product_ids, 1) IN (4,
                                                 5,
                                                 6) THEN 'Средний'
           WHEN array_length(product_ids, 1) > 6 THEN 'Большой'
       END AS order_size,
       count(order_id) AS orders_count
FROM orders
GROUP BY order_size
ORDER BY 2