SELECT order_id,
       TIME
FROM courier_actions
WHERE courier_id = 100
  AND action = 'deliver_order'
ORDER BY TIME DESC
LIMIT 10