SELECT *,
       unnest(product_ids) as product_id
FROM   orders 
LIMIT 100