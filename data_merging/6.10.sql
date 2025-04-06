SELECT user_id,
       order_id,
       product_ids
FROM user_actions ua
JOIN orders o USING (order_id)
WHERE ua.action = 'create_order'
  AND ua.order_id NOT IN
    (SELECT order_id
     FROM user_actions
     WHERE action = 'cancel_order')
ORDER BY 1,
         2
LIMIT 1000