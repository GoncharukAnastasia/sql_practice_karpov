SELECT   user_id,
         order_id,
         time,
         Row_number() OVER(partition BY user_id ORDER BY time)                                          order_number,
         Lag(                                            time) OVER(partition BY user_id ORDER BY time) time_lag,
         (Age(time, Lag(time) OVER(partition BY user_id)))                                              time_diff
FROM     user_actions
WHERE    order_id NOT IN
         (
                SELECT order_id
                FROM   user_actions
                WHERE  action = 'cancel_order')
ORDER BY 1,
         2 
LIMIT 1000