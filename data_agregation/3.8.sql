SELECT sum(price) as order_price
FROM  products
WHERE  name in ('сухарики', 'чипсы', 'энергетический напиток')