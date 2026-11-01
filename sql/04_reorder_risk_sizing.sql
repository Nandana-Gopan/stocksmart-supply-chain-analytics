

SELECT COUNT(*) AS total_records,
       SUM(CASE WHEN inventory_level < reorder_point
                THEN 1 ELSE 0 END) AS below_reorder_records,
       SUM(CASE WHEN demand_forecast > 0
                 AND inventory_level < demand_forecast * supplier_lead_time_days
                THEN 1 ELSE 0 END) AS leadtime_risk_records,
       SUM(CASE WHEN inventory_level < reorder_point
                 AND demand_forecast > 0
                 AND inventory_level < demand_forecast * supplier_lead_time_days
                THEN 1 ELSE 0 END) AS both_conditions
FROM stocksmart.inventory;