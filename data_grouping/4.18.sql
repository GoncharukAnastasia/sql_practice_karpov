SELECT user_id,
       count(DISTINCT CASE
                          WHEN action IN ('create_order', 'cancel_order') THEN order_id
                      END) AS orders_count,
       round(sum(CASE
                     WHEN action = 'cancel_order' THEN 1
                     ELSE 0
                 END) :: decimal / count(DISTINCT CASE
                                                      WHEN action IN ('create_order', 'cancel_order') THEN order_id
                                                  END), 2) AS cancel_rate
FROM user_actions
GROUP BY user_id
HAVING count(DISTINCT CASE
                          WHEN action IN ('create_order', 'cancel_order') THEN order_id
                      END) > 3
AND round(sum(CASE
                  WHEN action = 'cancel_order' THEN 1
                  ELSE 0
              END) :: decimal / count(DISTINCT CASE
                                                   WHEN action IN ('create_order', 'cancel_order') THEN order_id
                                               END), 2) >= 0.5
ORDER BY user_id ASC;