SELECT sex,
       date_part('year', max(age(birth_date)))::integer as max_age
FROM   users
GROUP BY 1
ORDER BY 2