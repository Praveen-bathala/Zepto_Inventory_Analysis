# Zepto_Inventory_Analysis
Project Overview:
This project explores and analyzes Zepto’s product inventory data using SQL.
It includes data cleaning, transformation, and analysis to derive actionable business insights such as revenue estimation, discount analysis, product categorization, and inventory weight analysis.

Dataset (CSV → SQL Table)
The dataset (zepto_v2) contains product details scraped from Zepto, including:

Column	Description:
sku_id	Unique product identifier (auto-generated)
name	Product name
category	Product category (e.g., Dairy, Snacks, Grocery)
mrp	Maximum Retail Price (in ₹)
discountPercent	Discount percentage (%)
availableQuantity	Stock available
discountedSellingPrice	Final selling price after discount
weightInGms	Product weight in grams
outOfStock	Availability status (TRUE/FALSE)
quantity	Unit count (pack size)

SQL Workflow:
Data Exploration:
Count rows & preview data
Identify null values
Find distinct categories
Check stock vs out-of-stock items
Detect duplicate product names

Data Cleaning:
Remove invalid prices (mrp = 0 or discountedSellingPrice = 0)
Convert prices from paise → rupees
Change price columns to DECIMAL type

Business Analysis Queries:
Top 10 Best Value Products – based on highest discount %
High MRP but Out-of-Stock Products – lost revenue opportunities
Estimated Revenue by Category – potential sales value
High MRP & Low Discount Products – premium/non-discounted items
Top 5 Categories by Average Discount % – customer-attractive categories
Price per Gram Analysis – cost efficiency for >100g products
Weight Categories – classify items into Low, Medium, Bulk
Total Inventory Weight by Category – stock distribution insights

Key Insights:
Categories with highest revenue potential can be identified.
Products with steep discounts highlight marketing strategy.
Stock-out items with high MRP show missed revenue opportunities.
Weight categorization helps understand consumer packaging demand.

Tools Used:
MySQL / PostgreSQL – SQL execution
CSV Dataset → SQL Import
SQL Joins, Aggregations, CASE, Window Functions

Contact:
Bathala Praveen
Aspiring Data Analyst | SQL & Python Enthusiast
LinkedIn: https://www.linkedin.com/in/praveenbathala22
Email: praveenbathala40187@gmail.com
