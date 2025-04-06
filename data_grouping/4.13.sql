SELECT courier_id
FROM courier_actions
WHERE TIME::date BETWEEN '2022-09-01' AND '2022-09-30'
  AND action = 'deliver_order'
GROUP BY 1
HAVING count(order_id) = 1
ORDER BY courier_id