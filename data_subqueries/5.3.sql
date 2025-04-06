with max_time as (SELECT max(time) :: date
                  FROM   courier_actions)
SELECT min(age((SELECT *
                FROM   max_time), birth_date)) :: varchar as min_age
FROM   couriers
WHERE  sex = 'male'