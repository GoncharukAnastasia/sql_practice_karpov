SELECT order_id,
       min(time) as time_accepted,
       max(time) as time_delivered,
       (extract(epoch
FROM   max(time)-min(time))/60)::integer as delivery_time
FROM   courier_actions
WHERE  order_id in (SELECT order_id
                    FROM   orders
                    WHERE  array_length(product_ids, 1) > 5)
   and order_id not in (SELECT order_id
                     FROM   user_actions
                     WHERE  action = 'cancel_order')
GROUP BY 1
ORDER BY order_id