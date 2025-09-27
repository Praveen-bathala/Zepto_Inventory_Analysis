USE zepto_analysis;
SELECT * FROM zepto_v2;

ALTER TABLE zepto_v2
ADD COLUMN sku_id SERIAL PRIMARY KEY;

SELECT * FROM zepto_v2;

-- data exploration

-- COUNT of rows
SELECT COUNT(*) FROM zepto_v2;

-- sample data
SELECT * FROM zepto_v2
LIMIT 10;

-- null values 
SELECT * FROM zepto_v2
WHERE name IS NULL 
OR category IS NULL 
OR mrp IS NULL 
OR discountPercent IS NULL 
OR availableQuantity IS NULL 
OR discountedSellingPrice IS NULL
OR WeightInGms IS NULL
OR outOfStock IS NULL
OR quantity IS NULL;

-- different product categories
SELECT DISTINCT category 
FROM zepto_v2
ORDER BY category;

-- products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto_v2
GROUP BY outOfStock;

-- product names present multiple times
SELECT name, COUNT(sku_id) AS Number_of_SKUs
FROM zepto_v2
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

-- data cleaning

-- products with price - 0
SELECT * FROM zepto_v2
WHERE mrp = 0 OR discountedSellingPrice = 0;

-- deleting the rows where mrp = 0
DELETE FROM zepto_v2
WHERE mrp = 0;

-- Convert mrp and discountedsellingprice from paise to rupees
UPDATE zepto_v2
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp, discountedSellingPrice 
FROM zepto_v2;

-- setting the mrp and discountedsellingprice from integer to decimal
ALTER TABLE zepto_v2
MODIFY COLUMN mrp DECIMAL(10,1),
MODIFY COLUMN discountedSellingPrice DECIMAL(10,1);

SELECT mrp, discountedSellingPrice 
FROM zepto_v2;

-- Q1 Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent 
FROM zepto_v2
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2 What are the products with high MRP but out of stock.
SELECT DISTINCT name, mrp 
FROM zepto_v2
WHERE outOfStock = "TRUE" and mrp > 300
ORDER BY mrp DESC;

-- Q3 Calculate Estimated Revenue for each category.
SELECT category, SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_v2
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4 Find all products where MRP is greater than $500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_v2
WHERE mrp > 500 and discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5 Identify the top 5 categories offering the highest average discount percentage.
SELECT category, AVG(discountPercent) AS avg_discount
FROM zepto_v2
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6 Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, 
discountedSellingPrice, 
discountedSellingPrice / WeightInGms AS price_per_gram
FROM zepto_v2
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7 Group the products into categories like low, medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN "Low"
	 WHEN weightInGms < 5000 THEN "Medium"
     ELSE "Bluk"
     END AS weight_category
FROM zepto_v2;

-- Q8 What is the Total Inventory Weight Per category
SELECT category, SUM(WeightInGms * availableQuantity) AS weight_per_category
FROM zepto_v2
GROUP BY category
ORDER BY weight_per_category DESC;




