SELECT user_id,
       (Extract(epoch
FROM   Avg(time_diff)) / 3600) :: integer as hours_between_orders
FROM   (SELECT user_id,
               order_id,
               time,
               row_number() OVER(PARTITION BY user_id
                                 ORDER BY time) order_number,
               lag(time) OVER(PARTITION BY user_id
                              ORDER BY time) time_lag,
               (age(time, lag(time) OVER(PARTITION BY user_id))) time_diff
        FROM   user_actions
        WHERE  order_id not in (SELECT order_id
                                FROM   user_actions
                                WHERE  action = 'cancel_order')) final
GROUP BY user_id having (max(order_number) != 1)
ORDER BY 1 
LIMIT 1000