--Total revenue by product category
--Q1. Which product categories generate the most revenue?
SELECT
    product_category,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM online_furniture_retailer
GROUP BY product_category
ORDER BY total_revenue DESC;

--Top brands by customer rating
--Q2. Which brands have the highest average customer rating?
SELECT 
    brand, 
    ROUND(AVG(customer_rating), 2) AS avg_rating
FROM 
    [dbo].[online_furniture_retailer]
GROUP BY 
    brand
ORDER BY 
    avg_rating DESC;

--Payment method popularity
--Q3.Which payment method is used most frequently by customers?
SELECT 
    payment_method,
    COUNT(*) AS usage_count
FROM 
    [dbo].[online_furniture_retailer]
GROUP BY 
    payment_method
ORDER BY 
    usage_count DESC

--Assembly service impact on total amount
--Q4.Do customers who request assembly service spend more on average than those who don’t?
SELECT 
    assembly_service_requested,
    ROUND(AVG(total_amount), 2) AS avg_spent
FROM 
    [dbo].[online_furniture_retailer]
GROUP BY 
    assembly_service_requested;

--Most expensive subcategory items
--Q5.Which product subcategories have the highest average product price?
-- Find product subcategories with the highest average product price
SELECT 
    product_subcategory,
    ROUND(AVG(product_price), 2) AS avg_price
FROM 
    [dbo].[online_furniture_retailer]
GROUP BY 
    product_subcategory
ORDER BY 
    avg_price DESC;
    













