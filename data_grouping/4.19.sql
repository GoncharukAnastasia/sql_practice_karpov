SELECT date_part('isodow', TIME :: timestamp) :: integer AS weekday_number,
       to_char(TIME :: timestamp, 'Dy') AS weekday,
       count(DISTINCT order_id) filter (
                                        WHERE action = 'create_order') AS created_orders,
       count(DISTINCT order_id) filter (
                                        WHERE action = 'cancel_order') AS canceled_orders,
       count(DISTINCT order_id) filter (
                                        WHERE action = 'create_order') - count(DISTINCT order_id) filter (
                                                                                                          WHERE action = 'cancel_order') AS actual_orders,
                                round((COUNT (DISTINCT order_id) filter (
                                                                         WHERE action = 'create_order') - count(DISTINCT order_id) filter (
                                                                                                                                           WHERE action = 'cancel_order')) / (count(DISTINCT order_id) filter (
                                                                                                                                                                                                               WHERE action = 'create_order') :: decimal), 3) AS success_rate
FROM user_actions
WHERE TIME :: date BETWEEN '2022-08-24' AND '2022-09-06'
GROUP BY 1,
         2
ORDER BY 1