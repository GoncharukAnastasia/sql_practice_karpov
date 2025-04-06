SELECT order_id
FROM   user_actions
WHERE  time between '2022-08-01 00:00:00'
   and '2022-09-01 00:00:00'
   and action = 'create_order'
ORDER BY order_id