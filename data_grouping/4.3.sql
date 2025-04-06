SELECT date_trunc('month', creation_time) as month,
       count(order_id) as orders_count
FROM   orders
GROUP BY 1
ORDER BY 1