SELECT user_id,
       order_id,
       action,
       time,
       count(order_id) filter (WHERE action = 'create_order') OVER(PARTITION BY user_id
                                                                   ORDER BY time) as created_orders,
       count(order_id) filter (WHERE action = 'cancel_order') OVER(PARTITION BY user_id
                                                                   ORDER BY time) as canceled_orders,
       round(count(order_id) filter (WHERE action = 'cancel_order') OVER(PARTITION BY user_id
                                                                         ORDER BY time) :: decimal / count(order_id) filter (WHERE action = 'create_order') OVER(PARTITION BY user_id ORDER BY time), 2) as cancel_rate
FROM   user_actions
ORDER BY user_id, order_id, time limit 1000