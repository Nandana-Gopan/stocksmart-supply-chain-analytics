
SELECT supplier_id,
       ROUND(AVG(supplier_lead_time_days), 2) AS avg_lead_time,
       ROUND(STDDEV(supplier_lead_time_days), 2) AS lead_time_stddev,
       SUM(CASE WHEN supplier_lead_time_days >= 12 THEN 1 ELSE 0 END) AS long_lead_records,
       ROUND(SUM(CASE WHEN supplier_lead_time_days >= 12 THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS long_lead_pct
FROM stocksmart.inventory
GROUP BY supplier_id
ORDER BY long_lead_pct DESC;