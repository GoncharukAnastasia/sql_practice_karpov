SELECT name,
       count(*) AS times_purchased
FROM
  (SELECT DISTINCT order_id,
                   unnest(product_ids) AS product_id
   FROM orders
   WHERE order_id IN
       (SELECT order_id
        FROM courier_actions
        WHERE action = 'deliver_order'
          AND date_part('month', TIME :: date) = 9
          AND date_part('year', TIME :: date) = 2022)) t
JOIN products USING (product_id)
GROUP BY name
ORDER BY 2 DESC
LIMIT 10