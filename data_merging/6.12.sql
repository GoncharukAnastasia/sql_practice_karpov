SELECT order_id,
       product_id,
       p.price
FROM
  (SELECT order_id,
          unnest(product_ids) AS product_id
   FROM orders) AS o
JOIN products AS p USING (product_id)
ORDER BY 1,
         2
LIMIT 1000