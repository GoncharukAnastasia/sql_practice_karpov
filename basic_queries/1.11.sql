SELECT courier_id,
       coalesce(cast(date_part('year', birth_date) as varchar), 'unknown') as birth_year
FROM   couriers
ORDER BY birth_year desc, courier_id