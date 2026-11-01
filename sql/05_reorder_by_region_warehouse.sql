
SELECT region,
       warehouse_id,
       COUNT(*) AS total_records,
       SUM(CASE WHEN inventory_level < reorder_point THEN 1 ELSE 0 END) AS below_reorder_records,
       ROUND(SUM(CASE WHEN inventory_level < reorder_point THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS below_reorder_pct
FROM stocksmart.inventory
GROUP BY region, warehouse_id
ORDER BY below_reorder_pct DESC;