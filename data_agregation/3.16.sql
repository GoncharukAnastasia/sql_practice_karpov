SELECT count(distinct user_id) - (count(distinct user_id) filter (WHERE action = 'cancel_order')) as users_count
FROM   user_actions