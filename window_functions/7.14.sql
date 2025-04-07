SELECT *
FROM   (SELECT courier_id,
               count(order_id) orders_count,
               Row_number() OVER(ORDER BY count(order_id) desc, courier_id) courier_rank
        FROM   courier_actions
        WHERE  action = 'deliver_order'
        GROUP BY 1) f
WHERE  courier_rank <= round(0.1 * (SELECT count(distinct courier_id)
                                    FROM   courier_actions))
ORDER BY 3