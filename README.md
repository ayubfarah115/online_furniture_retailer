# Online Furniture Analysis SQL Project

## Project Overview

**Project Title**: Online Funiture Analysis  

This project showcases practical SQL skills and analytical techniques employed by data analysts in real-world retail environments. The analysis covers the complete data workflow—from database creation and data cleaning to exploratory analysis and answering critical business questions through structured queries. Ideal for beginners and intermediate analysts, this project provides hands-on experience with SQL fundamentals and business-focused data analysis.

## Objectives

- **Create and manage a retail sales database**: Build a structured SQL database to store online furniture sales data efficiently.  

- **Clean and preprocess data using SQL**: Identify and remove null or inconsistent records to ensure accurate analysis.  

- **Explore data using SQL queries**: Perform exploratory analysis to understand customer behavior, product trends, and sales patterns.  

- **Analyse revenue and profitability**: Determine which products, categories, and subcategories drive the most revenue.  
 
- **Evaluate customer preferences and behavior**: Examine customer ratings, payment methods, and assembly service usage to uncover insights.  

- **Generate actionable business insights**: Use SQL queries to support strategic decisions in product assortment, pricing, and service offerings.

## Project Structure

### Data Cleaning

```sql

-- Display all records in the table
SELECT *
FROM dbo.online_furniture_retailer;

-- Identify rows with any NULLs in important columns
SELECT *
FROM dbo.online_furniture_retailer
WHERE product_category IS NULL
   OR product_subcategory IS NULL
   OR brand IS NULL
   OR delivery_status IS NULL
   OR assembly_service_requested IS NULL
   OR payment_method IS NULL
   OR order_id IS NULL
   OR customer_id IS NULL
   OR product_price IS NULL
   OR shipping_cost IS NULL
   OR assembly_cost IS NULL
   OR total_amount IS NULL
   OR delivery_window_days IS NULL
   OR customer_rating IS NULL;

-- Delete rows with NULLs in critical columns
DELETE FROM dbo.online_furniture_retailer
WHERE brand IS NULL
   OR shipping_cost IS NULL
   OR assembly_cost IS NULL
   OR customer_rating IS NULL;
```

### 1. **Which product categories generate the most revenue?**:
```sql
SELECT
    product_category,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM online_furniture_retailer
GROUP BY product_category
ORDER BY total_revenue DESC;
```

2. **Which brands have the highest average customer rating?**:
```sql
SELECT 
    brand, 
    ROUND(AVG(customer_rating), 2) AS avg_rating
FROM 
    [dbo].[online_furniture_retailer]
GROUP BY 
    brand
ORDER BY 
    avg_rating DESC;
```

3. **Which payment method is used most frequently by customers?**:
```sql
SELECT 
    payment_method,
    COUNT(*) AS usage_count
FROM 
    [dbo].[online_furniture_retailer]
GROUP BY 
    payment_method
ORDER BY 
    usage_count DESC;
```

4. **Do customers who request assembly service spend more on average than those who don't?**:
```sql
SELECT 
    assembly_service_requested,
    ROUND(AVG(total_amount), 2) AS avg_spent
FROM 
    [dbo].[online_furniture_retailer]
GROUP BY 
    assembly_service_requested;
```

5. **Which product subcategories have the highest average product price?**:
```sql
SELECT 
    product_subcategory,
    ROUND(AVG(product_price), 2) AS avg_price
FROM 
    [dbo].[online_furniture_retailer]
GROUP BY 
    product_subcategory
ORDER BY 
    avg_price DESC;
```

## Findings

- **Revenue Drivers**: Analysis reveals which product categories contribute most significantly to overall revenue, enabling strategic inventory and marketing decisions..
- **Brand Performance**: Customer ratings vary across brands, with top-rated brands showing strong customer satisfaction and loyalty potential..
- **Payment Preferences**: Clear patterns emerge in payment method usage, indicating customer preferences for specific transaction types.
- **Assembly Service Value**: Customers requesting assembly services demonstrate distinct spending patterns compared to those who don't, suggesting opportunities for service bundling.
- **Premium Product Segments**: Certain product subcategories command significantly higher average prices, identifying premium market segments within the furniture retail space.

## Reports

- **Category Revenue Analysis**: Comprehensive breakdown of revenue generation across all product categories, identifying top performers and growth opportunities.
- **Brand Rating Summary**: Detailed insights into brand performance based on customer satisfaction metrics.
- **Payment Method Trends**: Analysis of customer payment preferences and transaction patterns.
- **Service Impact Assessment**: Comparative analysis of spending behavior between customers who request assembly services and those who don't.
- **Payment Method Trends**: Subcategory-level price analysis highlighting premium segments and pricing opportunities.

## Conclusion

This project demonstrates essential SQL skills for analyzing online furniture retail data, from database setup and data cleaning to answering critical business questions. The insights derived from this analysis can inform strategic decisions around product category investments, brand partnerships, payment system optimization, service offerings, and pricing strategies. By understanding revenue patterns, customer preferences, and pricing dynamics, retailers can optimize their operations and enhance profitability in the competitive online furniture market.

## Data Source & Attribution
The dataset used in this project is sourced from Kaggle's Online Furniture Orders: Delivery & Assembly 2025 by Pratyush Puri. I independently developed the SQL analysis framework, formulated the business questions, and created all queries to extract meaningful insights from this retail dataset.


## Author - Ayub Farah


