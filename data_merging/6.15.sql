SELECT date(final.time) AS date,
       sum(final.prices) AS revenue
FROM
  (SELECT order_id,
          TIME,
          product_id,
          price AS prices
   FROM
     (SELECT order_id,
             TIME,
             unnest(product_ids) AS product_id
      FROM user_actions AS ua
      LEFT JOIN orders USING (order_id)
      WHERE order_id NOT IN
          (SELECT order_id
           FROM user_actions
           WHERE action = 'cancel_order')) AS f
   LEFT JOIN products USING (product_id)) AS FINAL
GROUP BY date
ORDER BY 1