# Data

The raw dataset is not stored in this repository.

Source: Kaggle, "High-Dimensional Supply Chain Inventory Dataset" by ziya07
https://www.kaggle.com/datasets/ziya07/high-dimensional-supply-chain-inventory-dataset

File used: supply_chain_dataset1.csv (91,250 rows, 15 columns).
The data is synthetic (generated), not from a real company. Check the licence on the Kaggle page before reusing it.

## Columns

| Column | Meaning |
|---|---|
| Date | Date of the daily inventory record |
| SKU_ID | Product identifier (50 SKUs) |
| Warehouse_ID | Warehouse holding the stock (5 warehouses) |
| Supplier_ID | Supplier for that SKU-warehouse pair (10 suppliers) |
| Region | Sales region (4 regions) |
| Units_Sold | Units sold that day |
| Inventory_Level | Stock level at the end of that day |
| Supplier_Lead_Time_Days | Supplier delivery lead time in days |
| Reorder_Point | Stock threshold for reordering |
| Order_Quantity | Quantity ordered (not used in this analysis) |
| Unit_Cost | Cost per unit |
| Unit_Price | Selling price per unit |
| Promotion_Flag | 1 if a promotion was running |
| Stockout_Flag | Recorded stockout (0 in every row, so not usable) |
| Demand_Forecast | Forecast demand in units |
