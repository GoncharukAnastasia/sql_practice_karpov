SELECT name,
       split_part(upper(name), ' ', 1) as first_word,
       price
FROM   products
ORDER BY name