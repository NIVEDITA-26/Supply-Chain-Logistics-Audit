

SELECT COUNT(*) FROM logistics_analysis.supply_chain_data;


DESCRIBE logistics_analysis.supply_chain_data;

SET GLOBAL local_infile = 1;


LOAD DATA LOCAL INFILE 'C:/Users/nived/Downloads/DataCo/DataCoSupplyChainDataset.csv' 
INTO TABLE logistics_analysis.supply_chain_data
CHARACTER SET latin1 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Step: Standardizing Date Formats
-- Converting 'shipping date' from text to actual DATE type for better time-series analysis

ALTER TABLE logistics_analysis.supply_chain_data 
ADD COLUMN shipping_date_fixed DATE;

-- Disable safe updates for this session
SET SQL_SAFE_UPDATES = 0;
--  Updating shpping date 
UPDATE logistics_analysis.supply_chain_data
SET shipping_date_fixed = STR_TO_DATE(`shipping date (DateOrders)`, '%m/%d/%Y %H:%i');
-- Turn it back on when finished
SET SQL_SAFE_UPDATES = 1;

-- Altering column names

ALTER TABLE logistics_analysis.supply_chain_data 
CHANGE COLUMN `Days for shipping (real)` Days_shipping_real INT,
CHANGE COLUMN `Days for shipment (scheduled)` Days_shipping_scheduled INT;



-- Finding Average delivery gap 

SELECT 
    Market, 
    COUNT(*) AS Total_Orders,
    ROUND(AVG(`Days for shipping (real)` - `Days for shipment (scheduled)`), 2) AS Avg_Delivery_Gap,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM logistics_analysis.supply_chain_data
GROUP BY Market
ORDER BY Avg_Delivery_Gap DESC;


-- 1. Market Performance Audit

SELECT 
    Market, 
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Days_shipping_real - Days_shipping_scheduled), 2) AS Avg_Delivery_Gap,
    ROUND(SUM(`Sales per customer`), 2) AS Total_Revenue -- Note: use backticks if name has spaces
FROM logistics_analysis.supply_chain_data
GROUP BY Market
ORDER BY Avg_Delivery_Gap DESC;

-- 2. High risk category analysis

SELECT 
    `Category Name`, 
    AVG(Days_shipping_real - Days_shipping_scheduled) AS Mean_Delay,
    SUM(`Benefit per order`) AS Total_Category_Profit
FROM logistics_analysis.supply_chain_data
GROUP BY `Category Name`
HAVING Mean_Delay > 0.5
ORDER BY Mean_Delay DESC
LIMIT 10;


-- 3. Financial Impact of late status

SELECT 
    `Delivery Status`,
    COUNT(*) AS Order_Count,
    ROUND(AVG(`Benefit per order`), 2) AS Avg_Profit_Per_Order
FROM logistics_analysis.supply_chain_data
GROUP BY `Delivery Status`
ORDER BY Avg_Profit_Per_Order ASC;