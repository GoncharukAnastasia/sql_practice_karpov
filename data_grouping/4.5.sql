SELECT sex,
       max(date_part('month', birth_date))::integer as max_month
FROM   users
GROUP BY 1
ORDER BY 1