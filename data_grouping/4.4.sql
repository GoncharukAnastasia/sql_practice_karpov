SELECT date_trunc('month', time) as month,
       action,
       count(order_id) as orders_count
FROM   user_actions
GROUP BY 1, 2
ORDER BY 1, 2