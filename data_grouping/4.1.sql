SELECT sex,
       count(courier_id) as couriers_count
FROM   couriers
GROUP BY 1
ORDER BY couriers_count