WITH valid_orders AS
  (SELECT order_id,
          product_ids
   FROM orders
   WHERE order_id NOT IN
       (SELECT order_id
        FROM user_actions
        WHERE action = 'cancel_order')),
     exploded_products AS
  (SELECT order_id,
          unnest(product_ids) AS product_id
   FROM valid_orders),
     product_names AS
  (SELECT ep.order_id,
          ep.product_id,
          p.name AS product_name
   FROM exploded_products ep
   JOIN products p USING (product_id)),
     product_pairs AS
  (SELECT DISTINCT p1.order_id,
                   least(p1.product_name, p2.product_name) AS product1,
                   greatest(p1.product_name, p2.product_name) AS product2
   FROM product_names p1
   JOIN product_names p2 ON p1.order_id = p2.order_id
   AND p1.product_name < p2.product_name)
SELECT array[product1,
             product2] AS pair,
            count(*) AS count_pair
FROM product_pairs
GROUP BY 1
ORDER BY count_pair DESC,
         pair ASC;