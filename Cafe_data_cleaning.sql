SELECT * 
FROM dirty_cafe_sales

DESCRIBE dirty_cafe_sales;

SET SQL_SAFE_UPDATES = 0;

-- Clean Item column by finding and replacing all unwanted values to NULL
SELECT DISTINCT Item
FROM dirty_cafe_sales

SELECT Item
FROM dirty_cafe_sales
WHERE Item IN ('UNKNOWN', 'ERROR', '')

UPDATE dirty_cafe_sales
SET Item = NULL
WHERE Item IN ('UNKNOWN', 'ERROR', '');

-- Quantity column is good!
SELECT DISTINCT Quantity
FROM dirty_cafe_sales

-- Price per unit column is good!
SELECT DISTINCT `Price Per Unit`
FROM dirty_cafe_sales

-- Clean Total Spent column by finding and replacing all unwanted values to NULL
SELECT DISTINCT `Total Spent`
FROM dirty_cafe_sales

SELECT `Total Spent`
FROM dirty_cafe_sales
WHERE `Total Spent` IN ('UNKNOWN', 'ERROR', '')

-- Lets Calculate the Total Spent column by multiplying Quantity by Price Per Unit
UPDATE `dirty_cafe_sales`
SET `Total Spent` = `Quantity` * `Price Per Unit`
WHERE `Total Spent` IS NULL
   OR `Total Spent` = 0;

-- Clean Payment Method column by finding and replacing all unwanted values to NULL
SELECT DISTINCT `Payment Method`
FROM dirty_cafe_sales

SELECT `Payment Method`
FROM dirty_cafe_sales
WHERE `Payment Method` IN ('UNKNOWN', 'ERROR', '');

UPDATE dirty_cafe_sales
SET `Payment Method` = NULL
WHERE `Payment Method` IN ('UNKNOWN', 'ERROR', '');

-- Clean Location column by finding and replacing all unwanted values to NULL
SELECT DISTINCT Location
FROM dirty_cafe_sales

SELECT Location
FROM dirty_cafe_sales
WHERE Location IN ('UNKNOWN', 'ERROR', '');

UPDATE dirty_cafe_sales
SET Location = NULL
WHERE Location IN ('UNKNOWN', 'ERROR', '');

-- Clean Transaction Date column by finding and replacing all unwanted values to NULL
SELECT DISTINCT `Transaction Date`
FROM dirty_cafe_sales

SELECT `Transaction Date`
FROM dirty_cafe_sales
WHERE `Transaction Date` IN ('UNKNOWN' , 'ERROR', '');

UPDATE dirty_cafe_sales
SET `Transaction Date` = NULL
WHERE `Transaction Date` IN ('UNKNOWN', 'ERROR' , '');

-- Fix data typing issues
-- CREATE TABLE backup AS SELECT * 

ALTER TABLE dirty_cafe_sales
MODIFY COLUMN `Total Spent` DOUBLE;

SELECT DISTINCT `Transaction Date`
FROM dirty_cafe_sales
WHERE `Transaction Date` NOT REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';

ALTER TABLE dirty_cafe_sales
MODIFY COLUMN `Transaction Date` DATE;