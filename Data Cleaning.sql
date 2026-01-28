--Showcase the Table
SELECT *
FROM online_furniture_retailer
-- Check any Nulls
SELECT *
FROM online_furniture_retailer
WHERE 
    product_category IS NULL
    OR  
    product_subcategory IS NULL
    OR 
    brand IS NULL
    OR
    delivery_status IS NULL
    OR
    assembly_service_requested IS NULL
    OR
    payment_method IS NULL
    OR
    order_id IS NULL
    OR
    customer_id IS NULL
    OR
    product_price IS NULL
    OR
    shipping_cost IS NULL
    OR
    assembly_cost IS NULL
    OR
    total_amount IS NULL
    OR
    delivery_window_days IS NULL
    OR
    customer_rating IS NULL

--Delete Nulls
	DELETE FROM online_furniture_retailer
WHERE 
    brand IS NULL
    OR shipping_cost IS NULL
    OR assembly_cost IS NULL
    OR customer_rating IS NULL;

