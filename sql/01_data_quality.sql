-- 01_data_quality.sql
-- StockSmart: data quality checks (ek hi result table me)

SELECT 'Total rows' AS check_name, COUNT(*) AS result
FROM stocksmart.inventory
UNION ALL
SELECT 'Distinct dates', COUNT(DISTINCT record_date) FROM stocksmart.inventory
UNION ALL
SELECT 'Distinct SKUs', COUNT(DISTINCT sku_id) FROM stocksmart.inventory
UNION ALL
SELECT 'Distinct warehouses', COUNT(DISTINCT warehouse_id) FROM stocksmart.inventory
UNION ALL
SELECT 'Distinct suppliers', COUNT(DISTINCT supplier_id) FROM stocksmart.inventory
UNION ALL
SELECT 'Distinct regions', COUNT(DISTINCT region) FROM stocksmart.inventory
UNION ALL
SELECT 'Duplicate SKU-warehouse-date rows',
       COUNT(*) - COUNT(DISTINCT sku_id, warehouse_id, record_date)
FROM stocksmart.inventory
UNION ALL
SELECT 'Negative units_sold', COUNT(*) FROM stocksmart.inventory WHERE units_sold < 0
UNION ALL
SELECT 'Negative inventory_level', COUNT(*) FROM stocksmart.inventory WHERE inventory_level < 0
UNION ALL
SELECT 'Unit price below unit cost', COUNT(*) FROM stocksmart.inventory WHERE unit_price < unit_cost
UNION ALL
SELECT 'NULL demand_forecast', COUNT(*) FROM stocksmart.inventory WHERE demand_forecast IS NULL
UNION ALL
SELECT 'Zero demand_forecast', COUNT(*) FROM stocksmart.inventory WHERE demand_forecast = 0
UNION ALL
SELECT 'SKUs with more than 1 supplier', COUNT(*)
FROM (SELECT sku_id FROM stocksmart.inventory
      GROUP BY sku_id HAVING COUNT(DISTINCT supplier_id) > 1) t
UNION ALL
SELECT 'Rows where inventory below reorder point', COUNT(*)
FROM stocksmart.inventory WHERE inventory_level < reorder_point
UNION ALL
SELECT 'Recorded stockouts (Stockout_Flag = 1)', COUNT(*)
FROM stocksmart.inventory WHERE stockout_flag = 1;