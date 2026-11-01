-- 02_revenue_profit.sql
-- Overall units, revenue, cost, gross profit aur margin

SELECT SUM(units_sold) AS total_units_sold,
       ROUND(SUM(units_sold * unit_price), 2) AS total_revenue,
       ROUND(SUM(units_sold * unit_cost), 2) AS total_cost,
       ROUND(SUM(units_sold * (unit_price - unit_cost)), 2) AS gross_profit,
       ROUND(SUM(units_sold * (unit_price - unit_cost))
             / SUM(units_sold * unit_price) * 100, 2) AS profit_margin_pct,
       ROUND(SUM(units_sold * unit_price) / SUM(units_sold), 2) AS avg_selling_price
FROM stocksmart.inventory;