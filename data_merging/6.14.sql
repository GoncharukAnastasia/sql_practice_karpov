WITH prices AS
  (SELECT final.order_id,
          sum(final.price) AS order_price
   FROM
     (SELECT order_id,
             product_id,
             p.price
      FROM
        (SELECT order_id,
                unnest(product_ids) AS product_id
         FROM orders) AS o
      JOIN products AS p USING (product_id)) AS FINAL
   GROUP BY order_id),
     avg_length AS
  (SELECT user_id,
          (array_length(product_ids, 1)) AS order_size
   FROM
     (SELECT user_id,
             order_id
      FROM user_actions
      WHERE order_id NOT IN
          (SELECT order_id
           FROM user_actions
           WHERE action = 'cancel_order')) t1
   LEFT JOIN orders USING(order_id)),
     sum_prices AS
  (SELECT ua.user_id,
          sum(p.order_price) AS sum_order_value
   FROM user_actions ua
   LEFT JOIN prices AS p USING (order_id)
   WHERE order_id NOT IN
       (SELECT order_id
        FROM user_actions
        WHERE action = 'cancel_order')
   GROUP BY ua.user_id)
SELECT user_id,
       count(DISTINCT order_id) AS orders_count,
       round(avg(order_size), 2) AS avg_order_size,
       sp.sum_order_value,
       round(avg(order_price), 2) AS avg_order_value,
       min(order_price) AS min_order_value,
       max(order_price) AS max_order_value
FROM
  (SELECT ua.user_id,
          ua.order_id,
          p.order_price
   FROM user_actions ua
   LEFT JOIN prices AS p USING (order_id)
   WHERE order_id NOT IN
       (SELECT order_id
        FROM user_actions
        WHERE action = 'cancel_order')) AS f
LEFT JOIN avg_length AS a USING (user_id)
LEFT JOIN sum_prices AS sp USING (user_id)
GROUP BY user_id,
         sp.sum_order_value
ORDER BY 1
LIMIT 1000