SELECT
  avg(order_price) as median_price
FROM
  (
    SELECT
      order_id,
      sum(price) as order_price,
      row_number() over (
        order by
          sum(price)
      ) as number,
      COUNT(*) OVER() AS total_rows
    FROM
      (
        SELECT
          order_id,
          unnest(product_ids) as product_id
        FROM
          orders
        WHERE
          order_id not in (
            SELECT
              order_id
            FROM
              user_actions
            WHERE
              action = 'cancel_order'
          )
      ) t1
      LEFT JOIN products using(product_id)
    GROUP BY
      1
  ) t2
WHERE
  number between total_rows / 2.0
  and total_rows / 2.0 + 1