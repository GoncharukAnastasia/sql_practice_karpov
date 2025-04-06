SELECT order_id
FROM   user_actions
WHERE  action = 'create_order'
   and order_id not in (SELECT order_id
                     FROM   user_actions
                     WHERE  action = 'cancel_order')
ORDER BY order_id limit 1000