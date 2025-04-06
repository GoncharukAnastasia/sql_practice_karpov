SELECT date_part('year', (age(birth_date)))::integer as age,
       sex,
       count(user_id) as users_count
FROM   users
WHERE  birth_date is not null
GROUP BY 1, 2
ORDER BY 1, 2