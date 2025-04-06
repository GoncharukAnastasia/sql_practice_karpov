SELECT count(order_id) AS orders,
       count(order_id) filter (
                               WHERE array_length(product_ids, 1) >= 5) AS large_orders,
       round(count(order_id) filter (
                                     WHERE array_length(product_ids, 1) >= 5) / count(order_id) :: decimal, 2) AS large_orders_share
FROM orders