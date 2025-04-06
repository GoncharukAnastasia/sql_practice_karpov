SELECT user_id,
       order_id,
       product_ids
FROM user_actions ua
JOIN orders o USING (order_id)
ORDER BY 1,
         2
LIMIT 1000