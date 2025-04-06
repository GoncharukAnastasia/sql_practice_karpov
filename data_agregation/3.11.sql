SELECT sum(CASE
               WHEN name = 'сухарики' THEN price * 3
               WHEN name = 'чипсы' THEN price * 2
               WHEN name = 'энергетический напиток' THEN price * 1
               ELSE price*0
           END) AS order_price
FROM products