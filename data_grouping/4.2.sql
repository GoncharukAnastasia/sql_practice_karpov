SELECT action,
       count(order_id) as orders_count
FROM   user_actions
GROUP BY 1
ORDER BY orders_count