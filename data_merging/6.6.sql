SELECT b.birth_date AS users_birth_date,
       a.birth_date AS couriers_birth_date,
       b.users_count AS users_count,
       a.couriers_count AS couriers_count
FROM
  (SELECT birth_date,
          count(courier_id) AS couriers_count
   FROM couriers
   WHERE birth_date IS NOT NULL
   GROUP BY birth_date) AS a
FULL JOIN
  (SELECT birth_date,
          count(user_id) AS users_count
   FROM users
   WHERE birth_date IS NOT NULL
   GROUP BY birth_date) AS b USING (birth_date)
ORDER BY 1,
         2