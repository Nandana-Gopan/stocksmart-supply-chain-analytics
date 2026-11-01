
SELECT supplier_id,
       COUNT(*) AS total_records,
       ROUND(AVG(supplier_lead_time_days), 2) AS avg_lead_time,
       MIN(supplier_lead_time_days) AS min_lead_time,
       MAX(supplier_lead_time_days) AS max_lead_time,
       ROUND(AVG(supplier_lead_time_days)
             - (SELECT AVG(supplier_lead_time_days) FROM stocksmart.inventory), 2) AS diff_vs_overall,
       RANK() OVER (ORDER BY AVG(supplier_lead_time_days) DESC) AS slowest_rank
FROM stocksmart.inventory
GROUP BY supplier_id
ORDER BY avg_lead_time DESC;