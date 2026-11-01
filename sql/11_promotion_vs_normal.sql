
SELECT CASE WHEN promotion_flag = 1 THEN 'Promotion' ELSE 'No promotion' END AS promo_status,
       COUNT(*) AS records,
       ROUND(AVG(units_sold), 2) AS avg_units_per_record,
       ROUND(AVG(demand_forecast), 2) AS avg_forecast_per_record,
       ROUND(AVG(unit_price), 2) AS avg_unit_price,
       ROUND(SUM(CASE WHEN inventory_level < reorder_point THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS below_reorder_pct,
       ROUND(SUM(ABS(units_sold - demand_forecast)) / SUM(units_sold) * 100, 2) AS wape_pct
FROM stocksmart.inventory
GROUP BY promo_status;