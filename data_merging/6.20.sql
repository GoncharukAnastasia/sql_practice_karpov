WITH max_time AS
  (SELECT max(TIME) :: date
   FROM user_actions)
SELECT order_id,
       user_id,
       date_part('year', age(
                               (SELECT *
                                FROM max_time), u.birth_date)) :: integer AS user_age,
       courier_id,
       date_part('year', age(
                               (SELECT *
                                FROM max_time), c.birth_date)) :: integer AS courier_age
FROM orders o
JOIN
  (SELECT order_id,
          user_id
   FROM user_actions
   WHERE action = 'create_order') ua USING (order_id)
JOIN
  (SELECT order_id,
          courier_id
   FROM courier_actions
   WHERE action = 'deliver_order') ca USING (order_id)
LEFT JOIN users u USING (user_id)
LEFT JOIN couriers c USING (courier_id)
ORDER BY array_length(o.product_ids, 1) DESC NULLS LAST, 1
LIMIT 5