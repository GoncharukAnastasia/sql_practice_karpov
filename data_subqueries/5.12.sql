SELECT courier_id,
       birth_date,
       sex
FROM   couriers
WHERE  courier_id in (SELECT courier_id
                      FROM   courier_actions
                      WHERE  action = 'deliver_order'
                         and time between '2022-09-01'
                         and '2022-10-01'
                      GROUP BY courier_id having count(distinct order_id) >= 30)
ORDER BY courier_id