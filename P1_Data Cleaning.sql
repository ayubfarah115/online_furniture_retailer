SELECT
COUNT(*)
FROM [dbo].[Retail Sales CSV]

-- Data Cleaning
SELECT *
FROM [dbo].[Retail Sales CSV]
WHERE 
	[transactions_id] IS NULL
	OR
	[sale_date] IS NULL
	OR
	[sale_time] IS NULL
	OR
	[customer_id] IS NULL
	OR
	[gender] IS NULL
	OR
	[category] IS NULL
	OR
	[quantiy] IS NULL
	OR
	[price_per_unit] IS NULL
	OR
	[cogs] IS NULL
	OR
	[total_sale] IS NULL


	Delete from [dbo].[Retail Sales CSV]
	WHERE 
		[transactions_id] IS NULL
	OR
		[sale_date] IS NULL
	OR
		[sale_time] IS NULL
	OR
		[customer_id] IS NULL
	OR
		[gender] IS NULL
	OR
		[category] IS NULL
	OR
		[quantiy] IS NULL
	OR
		[price_per_unit] IS NULL
	OR
		[cogs] IS NULL
	OR
		[total_sale] IS NULL;
