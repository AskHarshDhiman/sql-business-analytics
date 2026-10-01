-- Query 01: Monthly Revenue, Order Volume, and MoM Growth Rate
-- Purpose: Track month-over-month business expansion and revenue velocity.

WITH monthly_metrics AS (
    SELECT
        strftime('%Y-%m', order_date) AS order_month,
        COUNT(order_id) AS total_orders,
        ROUND(SUM(order_amount), 2) AS monthly_revenue
    FROM orders
    WHERE order_status = 'COMPLETED'
    GROUP BY strftime('%Y-%m', order_date)
)
SELECT
    order_month,
    total_orders,
    monthly_revenue,
    LAG(monthly_revenue, 1) OVER (ORDER BY order_month) AS previous_month_revenue,
    ROUND(
        (
            (monthly_revenue - LAG(monthly_revenue, 1) OVER (ORDER BY order_month))
            / LAG(monthly_revenue, 1) OVER (ORDER BY order_month)
        ) * 100.0,
        2
    ) AS mom_growth_pct
FROM monthly_metrics
ORDER BY order_month ASC;