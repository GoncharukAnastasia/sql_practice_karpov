SELECT coalesce(sex, 'unknown') AS sex,
       round(avg(cancel_rate), 3) AS avg_cancel_rate
FROM
  (SELECT user_id,
          round(count(DISTINCT order_id) filter (
                                                 WHERE action = 'cancel_order') :: decimal / count(DISTINCT order_id), 3) AS cancel_rate
   FROM user_actions
   GROUP BY 1) a
LEFT JOIN users USING (user_id)
GROUP BY 1
ORDER BY 1