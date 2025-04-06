SELECT count(distinct user_id) as users_count
FROM   user_actions
WHERE  action = 'create_order'
   and time >= ((SELECT max(time)
              FROM   user_actions) - interval '7 days')