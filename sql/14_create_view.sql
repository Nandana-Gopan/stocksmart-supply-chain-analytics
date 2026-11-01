
CREATE OR REPLACE VIEW stocksmart.inventory_enriched AS
SELECT record_date, sku_id, warehouse_id, supplier_id, region,
       units_sold, inventory_level, supplier_lead_time_days, reorder_point,
       order_quantity, unit_cost, unit_price, promotion_flag, stockout_flag,
       demand_forecast,
       units_sold * unit_price AS revenue,
       units_sold * unit_cost AS cost,
       units_sold * (unit_price - unit_cost) AS gross_profit,
       CASE WHEN inventory_level < reorder_point THEN 1 ELSE 0 END AS below_reorder_flag,
       CASE WHEN demand_forecast > 0
             AND inventory_level < demand_forecast * supplier_lead_time_days
            THEN 1 ELSE 0 END AS leadtime_risk_flag,
       CASE WHEN inventory_level < reorder_point
             AND demand_forecast > 0
             AND inventory_level < demand_forecast * supplier_lead_time_days
            THEN 'High Risk'
            WHEN inventory_level < reorder_point
              OR (demand_forecast > 0
                  AND inventory_level < demand_forecast * supplier_lead_time_days)
            THEN 'Watch'
            ELSE 'OK' END AS risk_status,
       ABS(units_sold - demand_forecast) AS abs_forecast_error,
       CASE WHEN supplier_lead_time_days >= 12 THEN 1 ELSE 0 END AS long_lead_flag
FROM stocksmart.inventory;