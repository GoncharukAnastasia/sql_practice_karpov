SELECT count(order_id) as orders_count
FROM   courier_actions
WHERE  action = 'accept_order'
   and action = 'accept_order'
   and order_id not in (SELECT order_id
                     FROM   courier_actions
                     WHERE  action = 'deliver_order')