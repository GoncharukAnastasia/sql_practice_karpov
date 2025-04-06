SELECT ua.user_id AS user_id_left,
       u.user_id AS user_id_right,
       order_id,
       TIME,
       action,
       sex,
       birth_date
FROM user_actions AS ua
LEFT JOIN users AS u USING (user_id)
WHERE u.user_id IS NOT NULL
ORDER BY 1