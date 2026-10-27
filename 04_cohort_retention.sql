USE arrowstack_task1;

WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id
),
customer_activity AS (
    SELECT DISTINCT
        customer_id,
        DATE_FORMAT(
            order_date, '%Y-%m-01'
        ) AS activity_month
    FROM orders
),
cohort_activity AS (
    SELECT
        fp.customer_id,
        DATE_FORMAT(
            fp.first_order_date, '%Y-%m-01'
        ) AS cohort_month,
        ca.activity_month,
        TIMESTAMPDIFF(
            MONTH,
            CAST(
                DATE_FORMAT(
                    fp.first_order_date, '%Y-%m-01'
                ) AS DATE
            ),
            CAST(ca.activity_month AS DATE)
        ) AS month_number
    FROM first_purchase fp
    JOIN customer_activity ca
        ON fp.customer_id = ca.customer_id
),
cohort_size AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_id) AS cohort_customers
    FROM cohort_activity
    WHERE month_number = 0
    GROUP BY cohort_month
),
retention AS (
    SELECT
        cohort_month,
        month_number,
        COUNT(DISTINCT customer_id) AS active_customers
    FROM cohort_activity
    GROUP BY cohort_month, month_number
)
SELECT
    r.cohort_month,
    r.month_number,
    r.active_customers,
    cs.cohort_customers,
    ROUND(
        100.0 * r.active_customers
        / cs.cohort_customers, 2
    ) AS retention_percentage
FROM retention r
JOIN cohort_size cs
    ON r.cohort_month = cs.cohort_month
ORDER BY r.cohort_month, r.month_number;