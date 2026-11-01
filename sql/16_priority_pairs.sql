

SELECT sku_id,
       warehouse_id,
       supplier_id,
       supplier_lead_time_days,
       reorder_point,
       ROUND(AVG(inventory_level), 0) AS avg_inventory,
       SUM(CASE WHEN risk_status = 'High Risk' THEN 1 ELSE 0 END) AS high_risk_days,
       SUM(below_reorder_flag) AS below_reorder_days,
       SUM(leadtime_risk_flag) AS leadtime_risk_days
FROM stocksmart.inventory_enriched
GROUP BY sku_id, warehouse_id, supplier_id, supplier_lead_time_days, reorder_point
ORDER BY high_risk_days DESC, leadtime_risk_days DESC
LIMIT 10;