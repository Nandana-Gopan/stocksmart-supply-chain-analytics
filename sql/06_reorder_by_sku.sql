
SELECT sku_id,
       COUNT(*) AS total_records,
       SUM(CASE WHEN inventory_level < reorder_point THEN 1 ELSE 0 END) AS below_reorder_records,
       ROUND(SUM(CASE WHEN inventory_level < reorder_point THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS below_reorder_pct,
       ROUND(AVG(inventory_level), 0) AS avg_inventory,
       ROUND(AVG(reorder_point), 0) AS avg_reorder_point
FROM stocksmart.inventory
GROUP BY sku_id
ORDER BY below_reorder_pct DESC
LIMIT 15;