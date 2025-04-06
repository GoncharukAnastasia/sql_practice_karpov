SELECT user_id,
       order_id,
       action,
       TIME
FROM user_actions
WHERE user_id IN (170,
                  200,
                  230)
  AND TIME BETWEEN '2022-08-25 00:00:00' AND '2022-09-05 00:00:00'
ORDER BY order_id DESC