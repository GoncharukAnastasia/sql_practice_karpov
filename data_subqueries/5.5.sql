with subquery as (SELECT round(avg(orders), 2)
                  FROM   (SELECT user_id,
                                 count(order_id) as orders
                          FROM   user_actions
                          WHERE  action = 'create_order'
                          GROUP BY user_id) as subquery_2)
SELECT user_id,
       count(order_id) as orders_count,
       (SELECT *
 FROM   subquery) as orders_avg, count(order_id) - (SELECT *
                                                   FROM   subquery) as orders_diff
FROM   user_actions
WHERE  action = 'create_order'
GROUP BY user_id
ORDER BY 1 limit 1000