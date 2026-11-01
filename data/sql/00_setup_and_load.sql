-- Creates the database and table, then loads the CSV.
-- Copy the CSV into the folder shown by: SHOW VARIABLES LIKE 'secure_file_priv';
-- and update the file path below.

CREATE DATABASE IF NOT EXISTS stocksmart;
USE stocksmart;

CREATE TABLE inventory (
    record_date DATE,
    sku_id VARCHAR(20),
    warehouse_id VARCHAR(20),
    supplier_id VARCHAR(20),
    region VARCHAR(20),
    units_sold INT,
    inventory_level INT,
    supplier_lead_time_days INT,
    reorder_point INT,
    order_quantity INT,
    unit_cost DECIMAL(12,4),
    unit_price DECIMAL(12,4),
    promotion_flag INT,
    stockout_flag INT,
    demand_forecast DECIMAL(12,4)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/supply_chain_dataset1.csv'
INTO TABLE stocksmart.inventory
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(record_date, sku_id, warehouse_id, supplier_id, region, units_sold, inventory_level,
 supplier_lead_time_days, reorder_point, order_quantity, unit_cost, unit_price,
 promotion_flag, stockout_flag, @df)
SET demand_forecast = NULLIF(TRIM(TRAILING '\r' FROM @df), '');
