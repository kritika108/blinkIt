Here are the SQL queries to extract the data visualized in the Blinkit dashboard
# Total Sales
 SELECT SUM(sales_amount) AS total_sales
FROM sales;
# Average Sales per Transaction
 SELECT AVG(sales_amount) AS avg_sales
FROM sales;
# Total Number of Items Sold
 SELECT COUNT(item_id) AS no_of_items
FROM sales;
# Average Customer Rating
 SELECT AVG(rating) AS avg_rating
FROM customer_reviews;
# Sales Trend Over Time (Outlet Establishment)
 SELECT YEAR(establishment_date) AS year, SUM(sales_amount) AS total_sales
FROM sales
JOIN outlets ON sales.outlet_id = outlets.outlet_id
GROUP BY YEAR(establishment_date)
ORDER BY year;
# Sales Distribution by Outlet Size
 SELECT outlet_size, SUM(sales_amount) AS total_sales
FROM sales
JOIN outlets ON sales.outlet_id = outlets.outlet_id
GROUP BY outlet_size;
# Sales Distribution by Outlet Location Type
 SELECT location_type, SUM(sales_amount) AS total_sales
FROM sales
JOIN outlets ON sales.outlet_id = outlets.outlet_id
GROUP BY location_type;
# Sales Distribution by Fat Content
 SELECT fat_content, SUM(sales_amount) AS total_sales
FROM sales
JOIN items ON sales.item_id = items.item_id
GROUP BY fat_content;
# Sales by Item Type
 SELECT item_type, SUM(sales_amount) AS total_sales
FROM sales
JOIN items ON sales.item_id = items.item_id
GROUP BY item_type
ORDER BY total_sales DESC;
# Outlet Type Metrics (Total Sales, Number of Items, Average Sales, Average Rating, Item Visibility)
 SELECT outlet_type, 
       SUM(sales_amount) AS total_sales,
       COUNT(item_id) AS no_of_items,
       AVG(sales_amount) AS avg_sales,
       AVG(customer_reviews.rating) AS avg_rating,
       AVG(items.visibility) AS avg_visibility
FROM sales
JOIN outlets ON sales.outlet_id = outlets.outlet_id
JOIN items ON sales.item_id = items.item_id
JOIN customer_reviews ON sales.customer_id = customer_reviews.customer_id
GROUP BY outlet_type;
