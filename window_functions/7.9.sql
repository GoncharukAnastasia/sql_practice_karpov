SELECT courier_id,
       count(order_id) as delivered_orders,
       round(avg(count(order_id)) OVER(), 2) as avg_delivered_orders,
       case when count(order_id) > round(avg(count(order_id)) OVER(), 2) then 1
            else 0 end as is_above_avg
FROM   courier_actions
WHERE  action = 'deliver_order'
   and date_part('month', time) = 9
   and date_part('year', time) = 2022
GROUP BY 1
ORDER BY 1