SELECT user_id
FROM user_actions
WHERE action = 'create_order'
GROUP BY user_id
HAVING max(TIME) < '2022-09-08'
ORDER BY 1