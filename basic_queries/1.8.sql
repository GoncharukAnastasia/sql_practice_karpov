SELECT name,
       price,
       price::varchar as price_char
FROM   products
ORDER BY name