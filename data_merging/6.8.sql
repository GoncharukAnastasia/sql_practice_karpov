SELECT user_id,
       name
FROM
  (SELECT user_id
   FROM users
   LIMIT 100) AS a
CROSS JOIN
  (SELECT name
   FROM products) AS b
ORDER BY 1,
         2