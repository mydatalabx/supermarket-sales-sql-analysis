/* =========================
   DATABASE SETUP
   ========================= */

CREATE DATABASE supermarket;
USE supermarket;

/* =========================
   TABLE STRUCTURE
   ========================= */

CREATE TABLE sales(
	invoice_id VARCHAR(50),
	branch VARCHAR(20),
	city VARCHAR(50),
	customer_type VARCHAR(20),
	gender VARCHAR(10),
	product_line VARCHAR(100),
	unit_price DECIMAL(10,2),
	quantity INT,
	tax_5 DECIMAL(10,2),
	total DECIMAL(10,2),
	date VARCHAR(20),
	time VARCHAR(20),
	payment VARCHAR(20),
	cogs DECIMAL(10,2),
	gross_margin_percentage DECIMAL(10,4),
	gross_income DECIMAL(10,2),
	rating DECIMAL(3,1)
);

/* =========================
   KPI SUMMARY
   Total revenue, orders, avg order value
   ========================= */

SELECT 
	COUNT(*) AS total_rows,
	ROUND(SUM(total),2) AS total_revenue,
	ROUND(AVG(total),2) AS avg_order_value
FROM sales;

/* =========================
   BRANCH PERFORMANCE DETAIL
   Orders, avg spend, revenue
   ========================= */

SELECT 
	branch,
	COUNT(*) AS total_orders,
	ROUND(AVG(total),2) AS avg_order_value,
	ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY branch
ORDER BY revenue DESC;

/* =========================
   CUSTOMER BEHAVIOR ANALYSIS
   ========================= */

SELECT
	branch,
	customer_type,
	ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY branch, customer_type
ORDER BY branch, revenue DESC;

SELECT 
	branch,
	customer_type,
	COUNT(*) AS orders,
	ROUND(AVG(total),2) AS avg_spend,
	ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY branch, customer_type 
ORDER BY branch, customer_type;

/* =========================
   PRODUCT INSIGHTS (GIZA FOCUS)
   ========================= */

SELECT 
	product_line,
	customer_type,
	COUNT(*) AS orders,
	ROUND(SUM(total),2) AS revenue
FROM sales
WHERE branch = 'Giza'
GROUP BY product_line, customer_type
ORDER BY product_line, revenue DESC;

SELECT 
    branch,
    COUNT(*) AS total_orders,
    ROUND(SUM(total),2) AS revenue,
    ROUND(AVG(total),2) AS avg_order_value
FROM sales
GROUP BY branch
ORDER BY revenue DESC;

/* =========================
   FOOD & BEVERAGES ANALYSIS
   ========================= */

SELECT 
	customer_type,
	ROUND(SUM(total),2) AS revenue
FROM sales
WHERE product_line = 'Food and beverages'
GROUP BY customer_type;

/* =========================
   PRODUCT LINE PERFORMANCE
   ========================= */

SELECT 
	product_line,
	ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY product_line
ORDER BY revenue DESC;

/* =========================
   CUSTOMER EXPERIENCE (RATINGS)
   ========================= */

SELECT 
	branch,
	ROUND(AVG(rating),2) AS avg_rating
FROM sales 
GROUP BY branch
ORDER BY avg_rating DESC;
