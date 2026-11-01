

SELECT DATE_FORMAT(record_date, '%Y-%m') AS risk_month,
       SUM(CASE WHEN inventory_level < reorder_point THEN 1 ELSE 0 END) AS below_reorder_records,
       ROUND(SUM(CASE WHEN inventory_level < reorder_point THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS below_reorder_pct,
       SUM(CASE WHEN demand_forecast > 0
                 AND inventory_level < demand_forecast * supplier_lead_time_days
                THEN 1 ELSE 0 END) AS leadtime_risk_records,
       ROUND(SUM(CASE WHEN demand_forecast > 0
                       AND inventory_level < demand_forecast * supplier_lead_time_days
                      THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS leadtime_risk_pct,
       ROUND(AVG(inventory_level), 0) AS avg_inventory
FROM stocksmart.inventory
GROUP BY risk_month
ORDER BY risk_month;