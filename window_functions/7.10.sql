SELECT time :: date as date,
       order_type,
       count(order_id) orders_count
FROM   (SELECT user_id,
               order_id,
               time,
               case when Row_number() OVER(PARTITION BY user_id
                                           ORDER BY time) = 1 then 'Первый'
                    else 'Повторный' end as order_type
        FROM   user_actions
        WHERE  order_id not in (SELECT order_id
                                FROM   user_actions
                                WHERE  action = 'cancel_order')) f
GROUP BY 1, 2
ORDER BY 1, 2