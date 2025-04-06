SELECT courier_id
FROM   couriers
WHERE  date_part('year', birth_date) between 1990
   and 1995
ORDER BY courier_id