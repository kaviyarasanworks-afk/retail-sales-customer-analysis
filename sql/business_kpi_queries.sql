-- View Dataset
select * 
from online_retail_db.online_retail_table;

-- Total Rows
select count(*) Total_Rows
from online_retail_db.online_retail_table;

-- Table Structure
DESCRIBE online_retail_db.online_retail_table;

-- Transaction Count
select TransactionType,
count(distinct Invoice)
from online_retail_db.online_retail_table
group by online_retail_table.TransactionType
order by TransactionType Desc;

-- Sales & Return Summary
select TransactionType,sum(abs(Quantity)) as Total_Quantity, sum(abs(Price)) Total_Price, sum(abs(Revenue)) Total_Revenue
from online_retail_db.online_retail_table
group by TransactionType 
order by TransactionType Desc;

-- Country-wise Sales Orders, Quantity & Revenue
select Country, 
COUNT(DISTINCT Invoice) AS Total_Orders,
sum(Quantity) Total_Quantity,
round(sum(Revenue),2) as Country_Revenue
from online_retail_db.online_retail_table
where TransactionType = 'Sale'
group by Country
order by Country_Revenue desc;

-- Year Sales Orders, Quantity & Revenue
select Year,
COUNT(DISTINCT Invoice) AS Total_Orders,
sum(Quantity) Total_Quantity,
round(sum(Revenue),2) as Year_Revenue
from online_retail_db.online_retail_table
where TransactionType = 'Sale'
group by Year
order by Year_Revenue;

-- Month Sales  Quantity & Revenue
select Month,
COUNT(DISTINCT Invoice) AS Total_Orders,
sum(Quantity) Total_Quantity, 
round(sum(Revenue),2) as Year_Revenue
from online_retail_db.online_retail_table
where TransactionType = 'Sale'
group by Month
order by Month_Num;

-- Quarter Sales  Quantity & Revenue
select Quarter,
COUNT(DISTINCT Invoice) AS Total_Orders,
sum(Quantity) Total_Quantity, 
round(sum(Revenue),2) as Year_Revenue
from online_retail_db.online_retail_table
where TransactionType = 'Sale'
group by Quarter;

-- Average Order Value (AOV)
select round(sum(Revenue)/Count(distinct Invoice),2) as AOV
from online_retail_db.online_retail_table
where TransactionType = 'Sale';

-- TOP 10 PRODUCTS BY SALES QUANTITY
select Description, sum(Quantity) as TOP_10_PRODUCTS
from online_retail_db.online_retail_table
where TransactionType = 'Sale'
group by Description
order by TOP_10_PRODUCTS desc
Limit 10;

-- Bottom 10 PRODUCTS BY SALES QUANTITY
select Description, sum(Quantity) as Bottom_10_PRODUCTS
from online_retail_db.online_retail_table
where TransactionType = 'Sale'
group by Description
order by Bottom_10_PRODUCTS
Limit 10;

-- Top 10 Customer
SELECT `Customer ID`,
       SUM(Revenue) AS TOP_10_CUSTOMERS
FROM online_retail_db.online_retail_table
WHERE TransactionType = 'Sale'
GROUP BY `Customer ID`
ORDER BY TOP_10_CUSTOMERS DESC
LIMIT 10;