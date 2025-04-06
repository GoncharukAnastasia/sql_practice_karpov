SELECT order_id,
       product_ids
FROM   orders
WHERE  order_id in (SELECT order_id
                    FROM   courier_actions
                    WHERE  action = 'deliver_order'
                    ORDER BY time desc limit 100)
ORDER BY order_id