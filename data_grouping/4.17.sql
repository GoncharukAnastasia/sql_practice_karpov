SELECT case when to_char(creation_time::timestamp,
                         'ID')::integer in (6, 7) then 'weekend'
            when to_char(creation_time::timestamp, 'ID')::integer between 1 and
                 5 then 'weekdays' end as week_part,
       round(avg(array_length(product_ids, 1)), 2) as avg_order_size
FROM   orders
GROUP BY week_part
ORDER BY avg_order_size