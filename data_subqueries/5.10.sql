SELECT user_id,
       birth_date
FROM users
WHERE sex = 'male'
  AND birth_date <
    (SELECT min(birth_date)
     FROM users
     WHERE sex = 'female')
ORDER BY user_id