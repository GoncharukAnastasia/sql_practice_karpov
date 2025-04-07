SELECT *,
       Row_number() OVER(PARTITION BY user_id
                         ORDER BY time) order_number
FROM   (SELECT user_id,
               order_id,
               time
        FROM   user_actions
        ORDER BY 1, 2) f
WHERE  order_id not in (SELECT order_id
                        FROM   user_actions
                        WHERE  action = 'cancel_order') 
LIMIT 1000