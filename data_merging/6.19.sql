SELECT order_id,
       array_agg(name) AS product_names
FROM
  (SELECT order_id,
          unnest(product_ids) AS product_id
   FROM orders) o
LEFT JOIN products USING (product_id)
GROUP BY 1
LIMIT 1000