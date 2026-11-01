
SELECT sku_id,
       SUM(units_sold) AS units_sold,
       ROUND(SUM(units_sold * unit_price), 2) AS revenue,
       ROUND(SUM(units_sold * (unit_price - unit_cost)), 2) AS gross_profit,
       ROUND(SUM(CASE WHEN inventory_level < reorder_point THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS below_reorder_pct,
       ROUND(SUM(CASE WHEN demand_forecast > 0
                       AND inventory_level < demand_forecast * supplier_lead_time_days
                      THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS leadtime_risk_pct,
       ROUND(SUM(ABS(units_sold - demand_forecast)) / SUM(units_sold) * 100, 2) AS wape_pct
FROM stocksmart.inventory
GROUP BY sku_id
ORDER BY units_sold DESC
LIMIT 10;