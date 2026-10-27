USE arrowstack_task1;

-- Query 1: Join four tables
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    p.product_name,
    oi.quantity,
    p.price,
    oi.quantity * p.price AS revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_date;

-- Query 2: Total revenue
SELECT
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id;

-- Query 3: Best-selling products
SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;

-- Query 4: Orders per customer
SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- Query 5: Check missing customer names
SELECT *
FROM customers
WHERE customer_name IS NULL
   OR TRIM(customer_name) = '';

-- Query 6: Check invalid quantities
SELECT *
FROM order_items
WHERE quantity <= 0;