SELECT user_id,
       round(avg(array_length(product_ids, 1)), 2) AS avg_order_size
FROM
  (SELECT user_id,
          order_id,
          product_ids
   FROM user_actions ua
   LEFT JOIN orders o USING (order_id)
   WHERE ua.order_id NOT IN
       (SELECT order_id
        FROM user_actions
        WHERE action = 'cancel_order')) AS a
GROUP BY user_id
ORDER BY 1
LIMIT 1000