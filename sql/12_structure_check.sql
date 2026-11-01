
SELECT COUNT(*) AS sku_warehouse_pairs,
       SUM(CASE WHEN n_suppliers > 1 THEN 1 ELSE 0 END) AS pairs_changing_supplier,
       SUM(CASE WHEN n_leadtimes > 1 THEN 1 ELSE 0 END) AS pairs_changing_leadtime,
       SUM(CASE WHEN n_reorder > 1 THEN 1 ELSE 0 END) AS pairs_changing_reorder_point,
       SUM(CASE WHEN n_prices > 1 THEN 1 ELSE 0 END) AS pairs_changing_price
FROM (SELECT sku_id, warehouse_id,
             COUNT(DISTINCT supplier_id) AS n_suppliers,
             COUNT(DISTINCT supplier_lead_time_days) AS n_leadtimes,
             COUNT(DISTINCT reorder_point) AS n_reorder,
             COUNT(DISTINCT unit_price) AS n_prices
      FROM stocksmart.inventory
      GROUP BY sku_id, warehouse_id) t;