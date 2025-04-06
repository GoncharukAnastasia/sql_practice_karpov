SELECT user_id,
       count(action) AS created_orders
FROM user_actions
WHERE TIME::date BETWEEN '2022-08-01' AND '2022-08-31'
  AND action = 'create_order'
GROUP BY user_id
ORDER BY created_orders DESC,
         user_id ASC
LIMIT 5;