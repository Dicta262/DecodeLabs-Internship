
CREATE DATABASE online_retail_analysis;

USE online_retail_analysis;

-- DATA CLEANING

SELECT * FROM online_retail;

SELECT CONVERT(DECIMAL(10,2), ROUND(Unit_Price,2)) AS Unit_Price
FROM online_retail;

ALTER TABLE online_retail
ALTER COLUMN Unit_Price DECIMAL(10,2);

SELECT CONVERT(DECIMAL(10,2), ROUND	(Total_Price,2)) AS Unit_Price
FROM online_retail;

ALTER TABLE online_retail
ALTER COLUMN Total_Price DECIMAL (10,2);

-- REMOVING BLANK ROWS

SELECT * FROM online_retail
WHERE Coupon_Code IS NULL OR Coupon_Code = '';

UPDATE online_retail
SET Coupon_Code = 'NO COUPON'
WHERE Coupon_Code IS NULL OR Coupon_Code = '';

SELECT * FROM online_retail;

-- EXTRACTING YEAR AND MONTH FROM ORDER DATE

SELECT Date, YEAR(Date) AS Order_Year
FROM online_retail;

SELECT DATENAME(MONTH,Date) AS Month
FROM online_retail;

ALTER TABLE online_retail
ADD Order_Year INT, Order_Month VARCHAR(50)

UPDATE online_retail
SET Order_Year =YEAR(Date), Order_Month = DATENAME(MONTH,Date);

SELECT Date, Order_Year, Order_Month
FROM online_retail;

SELECT * FROM online_retail;

-- QUERIES

-- DISPLAY ALL RECORDS

SELECT* FROM online_retail;


-- FILTERING RECORDS

-- FILTER CANCELLED ORDERS
SELECT Order_ID, Product, Order_Status, Total_Price 
FROM online_retail
WHERE Order_Status = 'Cancelled';

-- FILTER ONLINE PAYMENT METHOD 
SELECT Order_ID, Product, Payment_Method, Order_Status, Total_Price
FROM online_retail
WHERE Payment_Method = 'Online';

-- FILTER INSTAGRAM REFERRAL SOURCE
SELECT Order_ID, Product, Payment_Method, Order_Status, Referral_Source, Total_Price
FROM online_retail
WHERE Referral_Source = 'Instagram';


-- SORTING RECORDS

SELECT * FROM online_retail;

-- SORTING PRODUCTS BY HIGHEST TOTAL PRICE
SELECT Product, Coupon_Code, Total_Price
FROM online_retail
ORDER BY Total_Price DESC;

-- SORTING PRODUCTS BY LOWEST TOTAL PRICE
SELECT Product, Referral_Source, Total_Price
FROM online_retail
ORDER BY Total_Price ASC;


-- AGGREGATE FUNCTIONS

SELECT * FROM online_retail;

-- TOTAL NUMBER OF ORDERS
SELECT COUNT(Order_Id) AS Total_Orders
FROM online_retail;

-- TOTAL REVENUE
SELECT SUM(Total_Price) AS Total_Revenue
FROM online_retail;

-- AVERAGE ORDER VALUE
SELECT AVG(Total_Price) AS Average_Order_Value
FROM online_retail;

-- AVERAGE QUANTITY ORDERED
SELECT AVG(Quantity) AS Average_Quantity
FROM online_retail;


-- GROUP BY AND HAVING

SELECT * FROM online_retail;

-- TOTAL REVENUE BY PAYMENT METHOD
SELECT Payment_Method, SUM(Total_Price) AS Total_Revenue
FROM online_retail
GROUP BY Payment_Method
ORDER BY Total_Revenue DESC;

-- TOTAL REVENUE BY REFERRAL SOURCE
SELECT Referral_Source, SUM(Total_Price) AS Total_Revenue
FROM online_retail
GROUP BY Referral_Source
ORDER BY Total_Revenue DESC;

-- PRODUCTS WITH SALES GREATER THAN 2000
SELECT Product, SUM(Total_Price) AS Product_Sales
FROM online_retail
GROUP BY Product
HAVING SUM(Total_Price) > 2000;

-- TOP 3 PRODUCTS BY REVENUE
SELECT TOP 3 Product, SUM(Total_Price) AS Total_Revenue
FROM online_retail
GROUP BY Product
ORDER BY Total_Revenue DESC;
















