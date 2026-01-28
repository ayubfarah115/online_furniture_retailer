-- Data Exploration
-- Q1.Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT *
FROM [dbo].[Retail Sales]
WHERE sale_date = '2022-11-05';
--Q2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT *
FROM [dbo].[Retail Sales]
WHERE category = 'Clothing'
  AND sale_date >= '2022-11-01'
  AND sale_date <  '2022-12-01'
  AND quantity >= 4;

  --Q3. Write a SQL query to calculate the total sales (total_sale) for each category
  SELECT 
		category,
		SUM(total_sale) as net_sale,
		COUNT(*) as total_orders
  FROM [dbo].[Retail Sales]
 GROUP BY category;

 --Q4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
 
 SELECT  
	AVG(age) as avg_age
FROM [dbo].[Retail Sales]
WHERE category = 'Beauty' 

--Q5. Write a SQL query to find all transactions where the total_sale is greater than 1000
SELECT *
FROM [dbo].[Retail Sales]
WHERE total_sale > 1000

--Q6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT
	category,
	gender,
	COUNT(*) as total_transaction
FROM [dbo].[Retail Sales]
GROUP BY category,
		 gender

--Q7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
	YEAR(sale_date) AS [year],
	MONTH(sale_date) AS [month],
	SUM(total_sale) as avg_sale
FROM [dbo].[Retail Sales]
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY YEAR(sale_date), MONTH(sale_date) 


WITH MonthlyAvgSales AS (
    SELECT
        YEAR(sale_date)  AS sales_year,
        MONTH(sale_date) AS sales_month,
        AVG(total_sale)  AS avg_monthly_sale
    FROM [dbo].[Retail Sales]
    GROUP BY
        YEAR(sale_date),
        MONTH(sale_date)
)
SELECT
    sales_year,
    sales_month,
    avg_monthly_sale
FROM (
    SELECT *,
           RANK() OVER (
               PARTITION BY sales_year
               ORDER BY avg_monthly_sale DESC
           ) AS sales_rank
    FROM MonthlyAvgSales
) ranked
WHERE sales_rank = 1
ORDER BY sales_year;

--Q8. Write a SQL query to find the top 5 customers based on the highest total sales

SELECT TOP 5
    customer_id,
    SUM(total_sale) AS total_sales
FROM [dbo].[Retail Sales]
GROUP BY customer_id
ORDER BY total_sales DESC;

--Q9.Write a SQL query to find the number of unique customers who purchased items from each category
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM [dbo].[Retail Sales]
GROUP BY category
ORDER BY unique_customers DESC;

--Q10. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

SELECT 
    CASE 
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift,
    COUNT(transactions_id) AS NumberOfOrders
FROM [dbo].[Retail Sales]
GROUP BY 
    CASE 
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY NumberOfOrders DESC;

-- End of Project

