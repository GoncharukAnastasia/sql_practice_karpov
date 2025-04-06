SELECT order_id
FROM
  (SELECT DISTINCT order_id,
                   creation_time
   FROM orders
   WHERE order_id IN
       (SELECT order_id
        FROM courier_actions
        WHERE action = 'deliver_order')) o
LEFT JOIN courier_actions USING (order_id)
ORDER BY TIME - creation_time DESC
LIMIT 10