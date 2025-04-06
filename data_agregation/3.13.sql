SELECT age(max(birth_date), min(birth_date))::varchar AS age_diff
FROM users
WHERE sex = 'male'