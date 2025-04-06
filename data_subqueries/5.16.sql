SELECT date(time) as date,
       count(*) as first_orders
FROM   user_actions
WHERE  order_id in (SELECT min(order_id)
                    FROM   user_actions
                    WHERE  order_id not in (SELECT order_id
                                            FROM   user_actions
                                            WHERE  action = 'cancel_order')
                    GROUP BY user_id)
GROUP BY date
ORDER BY 1