SELECT round(avg(price), 2) AS avg_price
FROM products
WHERE (name like '%чай%'
       OR name like '%кофе%')
  AND name not like '%чайный гриб%'
  AND name not like '%иван-чай%'