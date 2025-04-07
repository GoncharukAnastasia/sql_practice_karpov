SELECT courier_id,
       date_part('day',((SELECT max(time)
                  FROM   courier_actions) - first_date)) :: int as days_employed, delivered_orders
FROM   (SELECT courier_id,
               min(time) filter (WHERE action = 'accept_order') as first_date,
               count(order_id) filter (WHERE action = 'deliver_order') as delivered_orders
        FROM   courier_actions
        GROUP BY 1) f
WHERE  date_part('day',((SELECT max(time)
                         FROM   courier_actions) - first_date)) :: int >= 10
ORDER BY 2 desc, 1