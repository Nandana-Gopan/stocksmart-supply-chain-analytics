
SELECT supplier_id,
       COUNT(DISTINCT CONCAT(sku_id, '-', warehouse_id)) AS sku_warehouse_pairs,
       ROUND(AVG(supplier_lead_time_days), 2) AS avg_lead_time,
       ROUND(SUM(long_lead_flag) / COUNT(*) * 100, 2) AS long_lead_pct,
       ROUND(SUM(CASE WHEN risk_status = 'High Risk' THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS high_risk_pct,
       ROUND(SUM(CASE WHEN risk_status <> 'OK' THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS watch_or_high_pct
FROM stocksmart.inventory_enriched
GROUP BY supplier_id
ORDER BY high_risk_pct DESC;