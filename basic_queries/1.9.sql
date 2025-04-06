SELECT concat('Заказ № ', order_id, ' создан ', date(creation_time)) AS order_info
FROM orders
LIMIT 200