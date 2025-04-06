SELECT round(count(DISTINCT order_id)/count(DISTINCT user_id)::decimal, 2) AS orders_per_user,
       count(DISTINCT order_id) AS unique_orders,
       count(DISTINCT user_id) AS unique_users
FROM user_actions