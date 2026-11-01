-- 03_monthly_demand.sql
-- Month-wise units, revenue, profit, forecast aur daily average

SELECT DATE_FORMAT(record_date, '%Y-%m') AS sales_month,
       SUM(units_sold) AS units_sold,
       ROUND(SUM(units_sold) / COUNT(DISTINCT record_date), 0) AS avg_daily_units,
       ROUND(SUM(units_sold * unit_price), 2) AS revenue,
       ROUND(SUM(units_sold * (unit_price - unit_cost)), 2) AS gross_profit,
       ROUND(SUM(demand_forecast), 0) AS forecast_units
FROM stocksmart.inventory
GROUP BY sales_month
ORDER BY sales_month;