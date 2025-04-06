SELECT courier_id,
       order_id,
       action,
       TIME
FROM courier_actions
ORDER BY courier_id,
         action,
         TIME DESC
LIMIT 1000