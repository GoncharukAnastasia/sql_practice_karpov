SELECT count(DISTINCT user_id) AS users_count
FROM user_actions AS ua
JOIN users AS u USING (user_id)