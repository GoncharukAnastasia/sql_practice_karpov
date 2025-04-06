SELECT count(DISTINCT ua.user_id) AS users_count
FROM user_actions AS ua
LEFT JOIN users AS u USING (user_id)