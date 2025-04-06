with last_action_date as (SELECT max(time) as last_action_date
                          FROM   user_actions), mean_age as (SELECT avg(date_part('year', age((SELECT *
                                                                                                        FROM   last_action_date), birth_date)) :: integer)
                                   FROM   users)
SELECT user_id,
       round(coalesce(date_part('year', age((SELECT *
                                      FROM   last_action_date), birth_date)) :: integer, (SELECT *
                                                    FROM   mean_age)))::integer as age
FROM   users
ORDER BY user_id