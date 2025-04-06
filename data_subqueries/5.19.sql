WITH expensive AS
  (SELECT product_id
   FROM products
   ORDER BY price DESC
   LIMIT 5),
     order_ex AS
  (SELECT order_id,
          product_ids,
          unnest(product_ids) AS product_id
   FROM orders)
SELECT DISTINCT order_id,
                product_ids
FROM
  (SELECT *
   FROM order_ex) AS e
WHERE product_id IN
    (SELECT product_id
     FROM expensive)
ORDER BY 1