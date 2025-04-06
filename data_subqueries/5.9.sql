WITH all_orders AS
  (SELECT order_id
   FROM user_actions
   WHERE action = 'create_order'),
     delivered_orders AS
  (SELECT order_id
   FROM courier_actions
   WHERE action = 'deliver_order'),
     canceled_orders AS
  (SELECT order_id
   FROM user_actions
   WHERE action = 'cancel_order'),
     undelivered_orders AS
  (SELECT order_id
   FROM all_orders
   WHERE order_id NOT IN
       (SELECT order_id
        FROM delivered_orders))
SELECT count(DISTINCT order_id) AS orders_undelivered,
       count(DISTINCT order_id) filter (
                                        WHERE order_id IN
                                            (SELECT *
                                             FROM canceled_orders)) AS orders_canceled,
       count(DISTINCT order_id) filter (
                                        WHERE order_id NOT IN
                                            (SELECT *
                                             FROM canceled_orders)) AS orders_in_process
FROM
  (SELECT *
   FROM undelivered_orders) AS undelivered_orders