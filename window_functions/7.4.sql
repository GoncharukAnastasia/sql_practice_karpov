SELECT *,
       sum(orders_count) OVER(ORDER BY date) :: integer orders_count_cumulative
FROM   (SELECT creation_time :: date as date,
               count(order_id) as orders_count
        FROM   orders
        WHERE  order_id not in (SELECT order_id
                                FROM   user_actions
                                WHERE  action = 'cancel_order')
        GROUP BY 1) as f