SELECT *
FROM   (SELECT unnest(product_ids) as product_id,
               count(*) as times_purchased
        FROM   orders
        WHERE  order_id not in (SELECT order_id
                                FROM   user_actions
                                WHERE  action = 'cancel_order')
        GROUP BY 1
        ORDER BY 2 desc limit 10) as a
ORDER BY product_id