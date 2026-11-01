
SELECT COALESCE(region, 'ALL REGIONS') AS region,
       SUM(units_sold) AS actual_units,
       ROUND(SUM(demand_forecast), 0) AS forecast_units,
       ROUND(SUM(ABS(units_sold - demand_forecast)), 0) AS total_abs_error,
       ROUND(SUM(ABS(units_sold - demand_forecast)) / SUM(units_sold) * 100, 2) AS wape_pct,
       ROUND(100 - SUM(ABS(units_sold - demand_forecast)) / SUM(units_sold) * 100, 2) AS accuracy_pct,
       ROUND((SUM(demand_forecast) - SUM(units_sold)) / SUM(units_sold) * 100, 2) AS bias_pct
FROM stocksmart.inventory
GROUP BY region WITH ROLLUP;