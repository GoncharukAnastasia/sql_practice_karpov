SELECT ua.user_id AS user_id_left,
       u.user_id AS user_id_right,
       order_id,
       TIME,
       action,
       sex,
       birth_date
FROM user_actions AS ua
JOIN users AS u ON u.user_id = ua.user_id
ORDER BY user_id_left