SELECT min(age(birth_date))::varchar AS min_age
FROM couriers
WHERE sex = 'male'