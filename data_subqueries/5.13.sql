SELECT round(avg(array_length(product_ids, 1)), 3) as avg_order_size
FROM   orders
WHERE  order_id in (SELECT order_id
                    FROM   user_actions
                    WHERE  action = 'cancel_order'
                       and user_id in (SELECT user_id
                                    FROM   users
                                    WHERE  sex = 'male'))