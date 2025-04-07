SELECT order_id,
       creation_time,
       order_price,
       sum(order_price) OVER (PARTITION BY creation_time :: date) as daily_revenue,
       round((order_price * 100) :: decimal / (sum(order_price) OVER (PARTITION BY creation_time :: date)),
             3) as percentage_of_daily_revenue
FROM   (SELECT o.order_id,
               o.creation_time,
               sum(p.price) as order_price
        FROM   (SELECT order_id,
                       unnest(product_ids) as product_id,
                       creation_time
                FROM   orders
                WHERE  order_id not in (SELECT order_id
                                        FROM   user_actions
                                        WHERE  action = 'cancel_order')) o
            LEFT JOIN products p
                ON p.product_id = o.product_id
        GROUP BY 1, 2) f
ORDER BY creation_time :: date desc, 5 desc, 1